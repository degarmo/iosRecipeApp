//
//  DataService.swift
//  RecipeList2
//
//  Created by CD on 1/27/22.
//

import Foundation

class DataService {
    
   static func getLocalData() -> [Recipe] {
        
        // Parse Local Data from JSON file
        
        // Get URL path to the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a URL  object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                }
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        return [Recipe]()
    }
}
