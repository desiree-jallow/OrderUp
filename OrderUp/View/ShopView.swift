//
//  ShopView.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopView: View {
    var categories: [Category] = [
        Category(id: 1, name: "Hats", imageName: "catHats"),
        Category(id: 2, name: "Shoes", imageName: "catShoes"),
        Category(id: 3, name: "Jewelry", imageName: "catJewelry"),
        Category(id: 4, name: "Dresses", imageName: "catDresses")]
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 20) {
                    ForEach(categories) { category in
                        CategoryView(category: category)
                    }
                }
            })
            .frame(height: 190)
            .offset(x: 10.0, y: -200)
            .navigationBarTitle(Text("Categories"))
        }
    }
}

struct CategoryView: View {
    var category: Category
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(width: 150.0, height: 150.0)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                Text(category.name)
                    .fontWeight(.bold)
            }
            
            Image(category.imageName)
                .resizable()
                .frame(width: 140, height: 140)
                .cornerRadius(10.0)
                .offset(x: -5,y: -10)
        }
    }
}


struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
