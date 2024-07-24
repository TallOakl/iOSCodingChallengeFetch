//
//  RecipeResponse.swift
//  Fetch iOS Coding Challenge
//
//  Created by Naomi Oakley on 7/23/24.
//

import Foundation

// necessary for JSON decoding to happen
struct DessertList: Codable {
    var meals: [DessertItem]
}
