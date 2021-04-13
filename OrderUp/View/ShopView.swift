//
//  ShopView.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopView: View {
    @State private var category = ShopCategory()
    @StateObject private var myItemList = ItemList()
    var body: some View {
        VStack {
            NavigationView {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 20) {
                        ForEach(categories) { category in
                            CategoryView(category: category)
                                .onTapGesture {
                                    self.category = category
                                    
                                }
                        }
                    }
                })
                .offset(x: 10)
                .navigationBarTitle(Text("Categories"))
                .navigationBarItems(trailing: CartView(cartItems: showCartItem()))
                
            }
            
            ItemsView(myItemList: myItemList, category: category)
            
        }
        
    }
    
    
    private func showCartItem() -> Int {
        return myItemList.shopItems.reduce(0, {$0 + $1.count})
        
    }
    
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}

