//
//  Category.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopCategory: Identifiable {
    var id: Int?
    var categoryName: String = "Hats"
    var imageName: String?
    
}

let categories: [ShopCategory] = [
    ShopCategory(id: 0, categoryName: "Hats", imageName: "catHats"),
    ShopCategory(id: 1, categoryName: "Shoes", imageName: "catShoes"),
    ShopCategory(id: 2, categoryName: "Jewelry", imageName: "catJewelry"),
    ShopCategory(id: 3, categoryName: "Dresses", imageName: "catDresses")]
