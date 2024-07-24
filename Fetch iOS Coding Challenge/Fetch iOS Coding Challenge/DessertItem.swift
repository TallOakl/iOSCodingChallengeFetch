//
//  Dessert.swift
//  Fetch iOS Coding Challenge
//
//  Created by Naomi Oakley on 7/22/24.
//

import Foundation

struct DessertItem: Identifiable, Hashable, Codable {
    
    // variables from JSON file
    var id: String { idMeal } // needed to conform to Identifiable protocol
    var strMeal:String
    var strMealThumb:String
    var idMeal:String
}
