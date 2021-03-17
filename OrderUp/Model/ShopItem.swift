//
//  ShopItem.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//


import SwiftUI

struct ShopItem: Identifiable {
    var category: String
    var price: Double
    var id: Int
    var name: String
    var description: String
    var imageName: String
}

let shopItems: [ShopItem] = [
    ShopItem(category: "hats", price: 120, id: 1, name: "Sierra Boater Hat", description: "Classic boater style wide-brimmed hat featured in a structured design with an embroidered ribbon around the crown.", imageName: "TheSierra1"),
    ShopItem(category: "hats", price: 130, id: 2, name: "Diamond Crown Felt Hat", description: "Classic wool felt hat featuring a turned up wide brim with a velvet ribbon around the crown.", imageName: "diamond"),
    ShopItem(category: "hats", price: 130, id: 3, name: "Rancher Felt Hat", description: "Top things off with this structured Australian wool hat featured in a round brim design with a ribbon on the crown.", imageName: "rancher"),
    ShopItem(category: "shoes", price: 145, id: 4, name: "Karhu Suede Fusion 2.0 Lace-Up Sneakers", description: "First introduced in 1996, these suede sneakers combine a classic palette with high-tech construction.", imageName: "fusion"),
    ShopItem(category: "shoes", price: 47.99, id: 5, name: "Sidewalk Low-Top Sneaker", description: "Made of color-block leather, they have MWL Cloud-lift insoles for a super-cushy, ultra-supportive fit that feels like walking on a...well, you know.", imageName: "sidewalk"),
    ShopItem(category: "shoes", price: 110, id: 6, name: "Kickoff Trainer Sneakers", description: "Our very first trainers have MWL Cloud-lift insoles for a super-cushy, ultra-supportive fit that feels like walking on a...well, you know.", imageName: "kickoff"),
    ShopItem(category: "jewelry", price: 58, id: 7, name: "Emilie Gold Multi Strand Necklace", description: "Mini versions of our most iconic silhouettes and delicate Chains put us in the freshly-showered-sun-soaked-warm-kinda mood.", imageName: "emilie"),
    ShopItem(category: "jewelry", price: 48, id: 8, name: "Ari Heart Gold Pendant Necklace", description: "Feminine and classic with an asymmetrical design, the Ari Heart Gold Pendant Necklace in Rose Quartz is our new obsession.", imageName: "heart"),
    ShopItem(category: "jewelry", price: 110, id: 9, name: "Tegan Y Necklace", description: "All about shape and movement, this Gold necklace is playful yet sophisticated.", imageName: "tegan"),
    ShopItem(category: "dresses", price: 68, id: 10, name: "Puff Sleeve Button Front Midi Dress", description: "Lightweight woven fabric creates a flattering V-neckline and a fitted bodice, framed by short puffy sleeves with elastic cuffs.", imageName: "white"),
    ShopItem(category: "dresses", price: 89, id: 11, name: "Dreamy Romance Backless Maxi Dress", description: "Gauzy woven chiffon sweeps across an apron neckline and into a darted bodice with a figure-flattering set-in waist.", imageName: "glam"),
    ShopItem(category: "dresses", price: 36.29, id: 12, name: "Women's A-Line Dress", description: "Midi Dress Half Sleeve Solid Color Button Summer Hot Casual ", imageName: "a-line")
]
    
