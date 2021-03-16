//
//  Category.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct Category: Identifiable {
    var id: Int
    var name: String
    var imageName: String
    
}

let categories: [Category] = [
    Category(id: 1, name: "Hats", imageName: "catHats"),
    Category(id: 2, name: "Shoes", imageName: "catShoes"),
    Category(id: 3, name: "Jewelry", imageName: "catJewelry"),
    Category(id: 4, name: "Dresses", imageName: "catDresses")]
