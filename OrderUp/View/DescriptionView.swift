//
//  DescriptionView.swift
//  OrderUp
//
//  Created by Desiree on 4/13/21.
//

import SwiftUI


struct DescriptionView: View {
    @ObservedObject var myItemList: ItemList
    var item: ShopItem
    var body: some View {
        
        HStack(alignment: .top) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipped()
                .background(RoundedRectangle(cornerRadius: 10), alignment: .center)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.itemName)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text(item.description)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                
                HStack {
                    
                    Text("$\(String(format: "%.2f", item.price))")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(.top)
                        .padding(.trailing)
                    
                    ToggleView(myItemList: myItemList, item: myItemList.shopItems[item.id])
                        
                        
                        
                }
                .contentShape(Rectangle())
                .padding(.bottom)
               
            }
            .frame(width: UIScreen.main.bounds.width / 1.75)
        }
        
    
        
    }
    

}
