//
//  CategoryViewModel.swift
//  Tracker
//
//  Created by Margarita Pitinova on 17.08.2023.
//

import UIKit
import CoreData

final class CategoryViewModel {
        
    private var categoryStore = TrackerCategoryStore.shared
    
    private (set) var categories: [TrackerCategory] = []
    
    @Observable
    private (set) var selectedCategory: TrackerCategory?
    
    init() {
        categoryStore.delegate = self
        self.categories = categoryStore.trackerCategories
    }
    
    func addCategory(_ toAdd: String) {
        try! self.categoryStore.addNewCategory(TrackerCategory(header: toAdd, trackers: []))
    }
    
    func addTrackerToCategory(to header: String?, tracker: Tracker) {
        try! self.categoryStore.addTrackerToCategory(to: header, tracker: tracker)
    }
    
    func selectCategory(_ at: Int) {
        self.selectedCategory = self.categories[at]
    }
}

extension CategoryViewModel: TrackerCategoryStoreDelegate {
    func store() {
        self.categories = categoryStore.trackerCategories
    }
}
