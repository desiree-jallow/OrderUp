//
//  ShopView.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        CategoryView()
    }
}

struct CategoryView: View {
    var body: some View {
        NavigationView {
            List {
               Text("Hello")
                
            }
            .navigationBarTitle(Text("Categories"))
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
