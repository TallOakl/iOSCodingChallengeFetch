//
//  DessertView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Naomi Oakley on 7/21/24.
//

import SwiftUI

struct DessertListView: View {
    
    @State private var dessertItems:[DessertItem] = [DessertItem]()
    var dataService = DataService()
    
    var body: some View {
        // creates list of essentially buttons to navigate to each dessert page
        NavigationView {
            List(dessertItems, id: \.self) { item in
                NavigationLink(destination: DessertRecipeView(itemID: item.idMeal)) {
                    DessertListRow(item: item)
                }
            }
            .navigationTitle("Dessert List")
        }
        .listStyle(.plain)
        // retrieves basic information from API about each dessert
        .onAppear(perform: {
            Task {
                do {
                    dessertItems = try await dataService.getDessert()
                } catch ErrorManager.invalidURL{
                    print("invalid URL")
                } catch ErrorManager.invalidResponse {
                    print("invalid response")
                } catch ErrorManager.invalidData {
                    print("invalid data")
                } catch {
                    print("unexpected error: \(error)")
                }
            }
        })
    }
}

#Preview {
    DessertListView()
}
