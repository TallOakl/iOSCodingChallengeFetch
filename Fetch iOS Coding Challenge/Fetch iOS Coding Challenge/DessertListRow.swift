//
//  DessertListRow.swift
//  Fetch iOS Coding Challenge
//
//  Created by Naomi Oakley on 7/22/24.
//

import SwiftUI

struct DessertListRow: View {
    
    // input of this view page is a DessertItem
    var item: DessertItem
    
    var body: some View {
        VStack {
            HStack {
                // dessert name left aligned
                Text(item.strMeal)
                    .bold()
                Spacer()
                // dessert image right aligned, AsyncImage needed since we are retrieving image url from API
                AsyncImage(url: URL(string: item.strMealThumb)) {image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Rectangle())
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.secondary)
                }
                .frame(width: 50, height:50)
                .cornerRadius(10)
            }
            .padding()
            .cornerRadius(10)
        }
    }
}

#Preview {
    // sample row using blackberry fool dessert
    DessertListRow(item: DessertItem(strMeal: "Blackberry Fool", strMealThumb: "https://www.themealdb.com/images/media/meals/rpvptu1511641092.jpg", idMeal: "52891"))
}
