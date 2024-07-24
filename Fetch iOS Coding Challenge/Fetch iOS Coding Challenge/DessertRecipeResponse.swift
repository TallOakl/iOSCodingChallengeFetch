//
//  DessertRecipeResponse.swift
//  Fetch iOS Coding Challenge
//
//  Created by Naomi Oakley on 7/24/24.
//

import Foundation

// necessary for JSON decoding to happen
struct DessertRecipeResponse: Hashable, Codable {
    var meals: [DessertRecipe]
}
