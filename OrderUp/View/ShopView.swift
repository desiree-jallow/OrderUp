//
//  ShopView.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 50) {
                    CategoryView()
                    CategoryView()
                    CategoryView()
                    CategoryView()
                }
            })
            .navigationBarTitle(Text("Categories"))
        }
    }
}

struct CategoryView: View {
    var categories: [Category] = [
        Category(name: "Hats", imageName: "CatHats"),
        Category(name: "Shoes", imageName: "CatShoes")]
    var body: some View {
        Rectangle()
            .frame(width: 200.0, height: 200.0)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
