//
//  ItemList.swift
//  OrderUp
//
//  Created by Desiree on 4/13/21.
//

import Foundation

class ItemList : ObservableObject {
  @Published  var shopItems: [ShopItem] = [
        ShopItem(itemCategory: "Hats", price: 120, id: 0, itemName: "Sierra Boater Hat", description: "Classic boater style wide-brimmed hat featured in a structured design with an embroidered ribbon around the crown.", imageName: "TheSierra1"),
        ShopItem(itemCategory: "Hats", price: 130, id: 1, itemName: "Diamond Crown Felt Hat", description: "Classic wool felt hat featuring a turned up wide brim with a velvet ribbon around the crown.", imageName: "diamond", count: 0),
        ShopItem(itemCategory: "Hats", price: 130, id: 2, itemName: "Rancher Felt Hat", description: "Top things off with this structured Australian wool hat featured in a round brim design with a ribbon on the crown.", imageName: "rancher", count: 0),
        ShopItem(itemCategory: "Shoes", price: 145, id: 3, itemName: "Karhu Suede Fusion 2.0 Lace-Up Sneakers", description: "First introduced in 1996, these suede sneakers combine a classic palette with high-tech construction.", imageName: "fusion", count: 0),
        ShopItem(itemCategory: "Shoes", price: 47.99, id: 4, itemName: "Sidewalk Low-Top Sneaker", description: "Made of color-block leather, they have MWL Cloud-lift insoles for a super-cushy, ultra-supportive fit that feels like walking on a...well, you know.", imageName: "sidewalk", count: 0),
        ShopItem(itemCategory: "Shoes", price: 110, id: 5, itemName: "Kickoff Trainer Sneakers", description: "Our very first trainers have MWL Cloud-lift insoles for a super-cushy, ultra-supportive fit that feels like walking on a...well, you know.", imageName: "kickoff", count: 0),
        ShopItem(itemCategory: "Jewelry", price: 58, id: 6, itemName: "Emilie Gold Multi Strand Necklace", description: "Mini versions of our most iconic silhouettes and delicate Chains put us in the freshly-showered-sun-soaked-warm-kinda mood.", imageName: "emilie", count: 0),
        ShopItem(itemCategory: "Jewelry", price: 48, id: 7, itemName: "Ari Heart Gold Pendant Necklace", description: "Feminine and classic with an asymmetrical design, the Ari Heart Gold Pendant Necklace in Rose Quartz is our new obsession.", imageName: "heart", count: 0),
        ShopItem(itemCategory: "Jewelry", price: 110, id: 8, itemName: "Tegan Y Necklace", description: "All about shape and movement, this Gold necklace is playful yet sophisticated.", imageName: "tegan", count: 0),
        ShopItem(itemCategory: "Dresses", price: 68, id: 9, itemName: "Puff Sleeve Button Front Midi Dress", description: "Lightweight woven fabric creates a flattering V-neckline and a fitted bodice, framed by short puffy sleeves with elastic cuffs.", imageName: "white", count: 0),
        ShopItem(itemCategory: "Dresses", price: 89, id: 10, itemName: "Dreamy Romance Backless Maxi Dress", description: "Gauzy woven chiffon sweeps across an apron neckline and into a darted bodice with a figure-flattering set-in waist.", imageName: "glam", count: 0),
        ShopItem(itemCategory: "Dresses", price: 36.29, id: 11, itemName: "Women's A-Line Dress", description: "Midi Dress Half Sleeve Solid Color Button Summer Hot Casual ", imageName: "a-line", count: 0)
    ]

}
