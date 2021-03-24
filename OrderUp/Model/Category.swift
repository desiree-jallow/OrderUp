//
//  Category.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopCategory: Identifiable {
    var id: Int = 5
    var categoryName: String = ""
    var imageName: String = ""
    
}

let categories: [ShopCategory] = [
    ShopCategory(id: 1, categoryName: "Hats", imageName: "catHats"),
    ShopCategory(id: 2, categoryName: "Shoes", imageName: "catShoes"),
    ShopCategory(id: 3, categoryName: "Jewelry", imageName: "catJewelry"),
    ShopCategory(id: 4, categoryName: "Dresses", imageName: "catDresses")]
