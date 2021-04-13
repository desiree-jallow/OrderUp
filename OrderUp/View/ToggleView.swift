//
//  ToggleView.swift
//  OrderUp
//
//  Created by Desiree on 4/13/21.
//

import SwiftUI

struct ToggleView: View {
    @ObservedObject var myItemList: ItemList
    var item: ShopItem
    var body: some View {
      
        if myItemList.shopItems[item.id].count < 1 {
                ButtonView()
                    .onTapGesture {
                        myItemList.shopItems[item.id].count += 1
                       
                    }
        } else  {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .contentShape(Rectangle())
                        .foregroundColor(Color(.lightGray))
                        
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 15)
                    {
                        Text("-")
                            .fontWeight(.bold)
                            .padding(.all, 6)
                            .foregroundColor(.red)
                            .background(Circle())
                            .foregroundColor(.white)
                            .onTapGesture {
                                if myItemList.shopItems[item.id].count > 0 {
                                    myItemList.shopItems[item.id].count -= 1
                                    
                                }
                            }
                        
                        Text("\(myItemList.shopItems[item.id].count)")
                            .fontWeight(.bold)
                        
                        Text("+")
                            .fontWeight(.bold)
                            .padding(.all, 6)
                            .foregroundColor(.red)
                            .background(Circle())
                            .foregroundColor(.white)
                            .onTapGesture {
                                myItemList.shopItems[item.id].count += 1
                            
                                
                            }
                    }
                    
                }
                .padding(.leading)
                .offset(x: 8, y: 5)
                .opacity(myItemList.shopItems[item.id].count < 1 ? 0 : 1)
                .contentShape(Rectangle())
            }
        
        }

    }
