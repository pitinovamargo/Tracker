//
//  TrackerStore.swift
//  Tracker
//
//  Created by Margarita Pitinova on 11.08.23.
//

import UIKit
import CoreData

protocol TrackerStoreDelegate: AnyObject {
    func store() -> Void
}

final class TrackerStore: NSObject {
    private var context: NSManagedObjectContext
    private var fetchedResultsController: NSFetchedResultsController<TrackerCoreData>!
    private let uiColorMarshalling = UIColorMarshalling()
    
    weak var delegate: TrackerStoreDelegate?
    
    var trackers: [Tracker] {
        guard
            let objects = self.fetchedResultsController.fetchedObjects,
            let trackers = try? objects.map({ try self.tracker(from: $0)})
        else { return [] }
        return trackers
    }
    
    convenience override init() {
        let context = (UIApplication.shared.delegate as! AppDelegate).context
        try! self.init(context: context)
    }
    
    init(context: NSManagedObjectContext) throws {
        self.context = context
        super.init()
        
        let fetch = TrackerCoreData.fetchRequest()
        fetch.sortDescriptors = [
            NSSortDescriptor(keyPath: \TrackerCoreData.id, ascending: true)
        ]
        let controller = NSFetchedResultsController(
            fetchRequest: fetch,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        controller.delegate = self
        self.fetchedResultsController = controller
        try controller.performFetch()
    }
    
    func addNewTracker(_ tracker: Tracker) throws {
        let trackerCoreData = TrackerCoreData(context: context)
        trackerCoreData.id = tracker.id
        trackerCoreData.title = tracker.title
        trackerCoreData.color = uiColorMarshalling.hexString(from: tracker.color)
        trackerCoreData.emoji = tracker.emoji
        trackerCoreData.schedule = tracker.schedule?.map {
            $0.rawValue
        }
        trackerCoreData.colorIndex = Int16(tracker.colorIndex)
        try context.save()
    }
    
    func updateTracker(_ tracker: Tracker, oldTracker: Tracker?) throws {
        let updated = try fetchTracker(with: oldTracker)
        guard let updated = updated else { return }
        updated.title = tracker.title
        updated.colorIndex = Int16(tracker.colorIndex)
        updated.color = uiColorMarshalling.hexString(from: tracker.color)
        updated.emoji = tracker.emoji
        updated.schedule = tracker.schedule?.map {
            $0.rawValue
        }
        try context.save()
    }
    
    func tracker(from trackerCoreData: TrackerCoreData) throws -> Tracker {
        guard let id = trackerCoreData.id,
              let emoji = trackerCoreData.emoji,
              let color = uiColorMarshalling.color(from: trackerCoreData.color ?? ""),
              let title = trackerCoreData.title,
              let schedule = trackerCoreData.schedule
        else {
            fatalError()
        }
        return Tracker(
            id: id,
            title: title,
            color: color,
            emoji: emoji,
            schedule: schedule.map({ WeekDay(rawValue: $0)!}),
            pinned: trackerCoreData.pinned,
            colorIndex: Int(trackerCoreData.colorIndex)
        )
    }
    
    func deleteTracker(_ tracker: Tracker?) throws {
        let toDelete = try fetchTracker(with: tracker)
        guard let toDelete = toDelete else { return }
        context.delete(toDelete)
        try context.save()
    }
    
    func pinTracker(_ tracker: Tracker?, value: Bool) throws {
        let toPin = try fetchTracker(with: tracker)
        guard let toPin = toPin else { return }
        toPin.pinned = value
        try context.save()
    }
    
    func fetchTracker(with tracker: Tracker?) throws -> TrackerCoreData? {
        guard let tracker = tracker else { fatalError() }
        let fetchRequest: NSFetchRequest<TrackerCoreData> = TrackerCoreData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", tracker.id as CVarArg)
        let result = try context.fetch(fetchRequest)
        return result.first
    }
}

extension TrackerStore: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        delegate?.store()
    }
}
