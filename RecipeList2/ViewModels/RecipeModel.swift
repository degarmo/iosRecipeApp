//
//  RecipeView.swift
//  RecipeList2
//
//  Created by CD on 1/27/22.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
        
    }
}
