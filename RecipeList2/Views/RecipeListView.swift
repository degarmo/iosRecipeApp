//
//  ContentView.swift
//  RecipeList2
//
//  Created by CD on 1/27/22.
//

import SwiftUI

struct RecipeListView: View {
    // Reference the view model
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                
                ScrollView {
                    LazyVStack (alignment: .leading){
                        ForEach(model.recipes) { r in
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    HStack {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(1)
                                        Text(r.name)
                                            .foregroundColor(.black)
                                    }
                                })
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
