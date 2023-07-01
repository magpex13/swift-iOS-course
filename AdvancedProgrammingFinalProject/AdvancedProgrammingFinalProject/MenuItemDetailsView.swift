//
//  MenuItemDetailsView.swift
//  AdvancedProgrammingFinalProject
//
//  Created by Magno on 5/05/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let menuItem: MenuItemProtocol
    
    var body: some View {
        VStack {
            Text(menuItem.title)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("littlelemonlogo")
                .resizable()
                .scaledToFit()
            
            VStack {
                Text("**Price**")
                Text("\(menuItem.price)")
            }
            
            VStack {
                Text("**Ordered:**")
                Text("\(menuItem.ordersCount)")
            }
            
            VStack {
                Text("**Ingredients:**")
                ForEach(menuItem.ingredients, id: \.self) { ingredient in
                    Text(ingredient.rawValue)
                }
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let menuData = MockData()
        MenuItemDetailsView(menuItem: menuData.foods[0])
    }
}
