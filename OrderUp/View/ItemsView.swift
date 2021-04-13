//
//  ItemsView.swift
//  OrderUp
//
//  Created by Desiree on 4/13/21.
//

import SwiftUI

struct ItemsView: View {
    @ObservedObject var myItemList: ItemList
    var category: ShopCategory
    var body: some View {
        
        HStack {
            
            Text(category.categoryName == "" ? "Hats" : category.categoryName)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.leading)
            
            Spacer()
        }
        
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
          
            ForEach(showItems(category: category)) { item in

                
                DescriptionView(myItemList: myItemList, item: item)
                
        
            }
            
        })
        
    }
    
    private func showItems(category: ShopCategory) -> [ShopItem] {
        var items = [ShopItem]()
        switch category.categoryName {
        case "Hats":
            items = myItemList.shopItems.filter {$0.itemCategory == "Hats"}
        case "Shoes":
            items = myItemList.shopItems.filter {$0.itemCategory == "Shoes"}
        case "Jewelry":
            items = myItemList.shopItems.filter {$0.itemCategory == "Jewelry"}
        case "Dresses":
            items = myItemList.shopItems.filter {$0.itemCategory == "Dresses"}
        
        default:
            break
        }
       return items
    }

        
}
