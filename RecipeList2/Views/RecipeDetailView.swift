//
//  RecipeDetailView.swift
//  RecipeList2
//
//  Created by CD on 2/8/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                
                // Mark: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading){
                    // Mark: Recipe Ingredients
                    Text("Ingredients").font(.headline).padding(.bottom, 5)
                    // Mark: ForEach Ingredients
                    ForEach (recipe.ingredients, id:\.self){ r in
                        Text(" • " + r).padding([.bottom, .top], 1)
                    }
                    // Mark: Divider
                    Divider()
                VStack(alignment: .leading) {
                    // Mark: Recipe Directions
                    Text("Directions").font(.headline).padding([.bottom, .top], 5)
                    ForEach(0..<recipe.directions.count, id:\.self) { r in
                        Text(String(r+1) + ". " + recipe.directions[r]).padding(.bottom, 2)
                        }
                    }
                }.padding(.horizontal)
            }
        }.navigationBarTitle(recipe.name).font(.headline)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
