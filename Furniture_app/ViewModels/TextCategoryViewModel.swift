//
//  TextItemViewModel.swift
//  Furniture_app
//
//  Created by mohamed loukil on 20/11/2023.
//

import Foundation

class TextCategoryViewModel: ObservableObject {
    @Published var textCategories: [TextCategory] = []
   
    init() {
            loadCategories()
        }

        private func loadCategories() {
            APIService.shared.fetchTextCategory { [weak self] categories in
                self?.textCategories = categories
            }
        }
    
}
