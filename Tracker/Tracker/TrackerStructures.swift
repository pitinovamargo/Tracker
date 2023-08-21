//
//  TrackerStructures.swift
//  Tracker
//
//  Created by Margarita Pitinova on 01.08.2023.
//

import UIKit

struct Tracker {
    let id: UUID
    let title: String
    let color: UIColor
    let emoji: String
    let schedule: [WeekDay]?
    let pinned: Bool
    let colorIndex: Int
}

struct TrackerCategory {
    let header: String
    let trackers: [Tracker]
}

struct TrackerRecord {
    let id: UUID
    let date: Date
}
