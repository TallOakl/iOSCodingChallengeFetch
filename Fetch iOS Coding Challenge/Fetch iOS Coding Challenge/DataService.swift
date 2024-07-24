//
//  DataService.swift
//  Fetch iOS Coding Challenge
//
//  Created by Naomi Oakley on 7/22/24.
//

import Foundation

struct DataService {
    
    // function to retrieve basic information for all dessert items
    func getDessert() async throws -> [DessertItem] {
        // takes string and converts to URL (of the API)
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: endpoint) else {
            throw ErrorManager.invalidURL
        }
        // cast a request to API, stores data and response, response must be 200 for data to be accessed
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorManager.invalidResponse
        }
        // decode data from JSON format to struct format (format shown in DessertItem file)
        do {
            let decoder = JSONDecoder()
            let dessertList = try decoder.decode(DessertList.self, from: data)
            return dessertList.meals
        } catch {
            throw ErrorManager.invalidData
        }
    }
    
    // function to retrieve complete information for specific dessert item
    func getDessertRecipe(itemID: String) async throws -> DessertRecipe? {
        // takes string and dessert ID and converts to URL (of the API)
        let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=" + itemID
        guard let url = URL(string: endpoint) else {
            throw ErrorManager.invalidURL
        }
        // cast a request to API, stores data and response, response must be 200 for data to be accessed
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorManager.invalidResponse
        }
        // decode data from JSON format to struct format (format shown in DessertRecipe file)
        do {
            let decoder = JSONDecoder()
            let dessertRecipeResponse = try decoder.decode(DessertRecipeResponse.self, from: data)
            return dessertRecipeResponse.meals.first
        } catch {
            throw ErrorManager.invalidData
        }
    }
}
