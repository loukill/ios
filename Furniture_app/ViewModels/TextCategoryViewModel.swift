//
//  TextItemViewModel.swift
//  Furniture_app
//
//  Created by mohamed loukil on 20/11/2023.
//

import Foundation

class TextCategoryViewModel: ObservableObject {
    @Published var textIds: [String] = []
    @Published var textTitles: [String] = []
   
    init() {
        loadTexts()
        }

    private func loadTexts() {
            APIService.shared.fetchTexts { [weak self] texts in
                let titles = texts.map { $0.titre }
                let ids = texts.map { $0.id }
                self?.textIds = ids
                self?.textTitles = titles
            }
        }
    
}
