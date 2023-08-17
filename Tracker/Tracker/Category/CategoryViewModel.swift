//
//  CategoryViewModel.swift
//  Tracker
//
//  Created by Margarita Pitinova on 17.08.2023.
//

import UIKit

final class CategoryViewModel {
    
    private (set) var categories: [String] = []
    
    @Observable
    private (set) var selectedCategory: String = ""
    
    func addCategory(_ toAdd: String) {
        self.categories.append(toAdd)
    }
    
    func selectCategory(_ at: Int) {
        self.selectedCategory = self.categories[at]
    }
}
