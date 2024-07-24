//
//  DessertItemView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Naomi Oakley on 7/22/24.
//

import SwiftUI

struct DessertRecipeView: View {
    
    // input needed for view
    var itemID: String
    // inputs that can only be nonempty after connection with API, therefore optional at beginning
    @State private var dessertRecipe: DessertRecipe?
    @State private var ingredients: [String?] = []
    @State private var measures: [String?] = []
    var dataService = DataService()
    
    var body: some View {
        ScrollView {
            VStack {
                // title of page essentially
                Text(dessertRecipe?.strMeal ?? "Recipe")
                    .font(.title)
                // image of dessert
                AsyncImage(url: URL(string: dessertRecipe?.strMealThumb ?? "")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Rectangle())
                    } else if phase.error != nil {
                        Rectangle()
                        .foregroundColor(.teal)
                    } else {
                        Rectangle()
                        .foregroundColor(.secondary)
                    }
                }
                // bullet point list of measurements and corresponding ingredient with no empty or null values
                HStack {
                    Text("Ingredients")
                        .font(.title2)
                        .padding()
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(0..<ingredients.count, id: \.self) { index in
                        if let measure = measures[index], let ingredient = ingredients[index] {
                            if measure != "" {
                                HStack {
                                    Text("• \(measure) \(ingredient)")
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .padding()
                Spacer()
                // dessert instructions
                HStack {
                    Text("Directions")
                        .font(.title2)
                        .padding()
                    Spacer()
                }
                Text(dessertRecipe?.strInstructions ?? "")
                    .padding()
            }
            // how to retrieve complete data from API for single dessert
            .onAppear {
                Task {
                    do {
                        dessertRecipe = try await dataService.getDessertRecipe(itemID: itemID)
                        if let recipe = dessertRecipe {
                            ingredients = [
                                recipe.strIngredient1, recipe.strIngredient2, recipe.strIngredient3, recipe.strIngredient4, recipe.strIngredient5,
                                recipe.strIngredient6, recipe.strIngredient7, recipe.strIngredient8, recipe.strIngredient9, recipe.strIngredient10,
                                recipe.strIngredient11, recipe.strIngredient12, recipe.strIngredient13, recipe.strIngredient14, recipe.strIngredient15,
                                recipe.strIngredient16, recipe.strIngredient17, recipe.strIngredient18, recipe.strIngredient19, recipe.strIngredient20]
                            measures = [
                                recipe.strMeasure1, recipe.strMeasure2, recipe.strMeasure3, recipe.strMeasure4, recipe.strMeasure5,
                                recipe.strMeasure6, recipe.strMeasure7, recipe.strMeasure8, recipe.strMeasure9, recipe.strMeasure10,
                                recipe.strMeasure11, recipe.strMeasure12, recipe.strMeasure13, recipe.strMeasure14, recipe.strMeasure15,
                                recipe.strMeasure16, recipe.strMeasure17, recipe.strMeasure18, recipe.strMeasure19, recipe.strMeasure20]
                        }
                    } catch ErrorManager.invalidURL {
                        print("invalid URL")
                    } catch ErrorManager.invalidResponse {
                        print("invalid response")
                    } catch ErrorManager.invalidData {
                        print("invalid data")
                    } catch {
                        print("unexpected error: \(error)")
                    }
                }
            }
        }
    }
}

#Preview {
    // example using blackberry fool again
    DessertRecipeView(itemID: "52891")
}
