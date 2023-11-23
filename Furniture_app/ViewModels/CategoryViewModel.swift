//
//  CategoryViewModel.swift
//  Furniture_app
//
//  Created by mohamed loukil on 20/11/2023.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []

    init() {
        loadCategories()
    }

    func loadCategories() {
        APIService.shared.fetchCategories { [weak self] fetchedCategories in
            self?.categories = fetchedCategories
        }
    }
}
