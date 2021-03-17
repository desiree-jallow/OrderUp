//
//  ShopView.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        VStack {
            NavigationView {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 20) {
                        ForEach(categories) { category in
                            CategoryView(category: category)
                        }
                    }
                })
                
                .offset(x: 10)
                .navigationBarTitle(Text("Categories"))
                .navigationBarItems(trailing: CartView(cartItems: shopItems.count))
            }
            
            ItemsView()
            
        }
    }
}

struct ItemsView: View {
    var body: some View {
        Text("Hats")
            .font(.largeTitle)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .offset(x: -140, y: 10.0)
            
    
        List(shopItems) { item in
            VStack {
                HStack {
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 140, height: 140)
                        .clipped()
                        .background(RoundedRectangle(cornerRadius: 10), alignment: .center)
                        .foregroundColor(.gray)
                        .padding(.trailing)
                        .position(x: 110, y: 75)
                        
                    DescriptionView(item: item)
    
                }
                
                Spacer(minLength: 10)
            }
            
        }
        .frame(width: 500, height: 350, alignment: .topLeading)
    }
}

struct DescriptionView: View {
    var item: ShopItem
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item.name)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            Text(item.description)
                .foregroundColor(.gray)
                .font(.caption)
            
            HStack {
                
                Text("$\(String(format: "%.2f", item.price))")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding(.top)
                    
                Spacer(minLength: 30)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    
                    Text("add to cart")
                        .padding(.all, 6.0)
                        .foregroundColor(.white)
                        .font(.body)
                        .background(Rectangle())
                        .cornerRadius(10)
                        .frame(width: 120, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.red)
                }
                
            }
           
        }
        .offset(x: -50, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
    }
}

struct CartView: View {
    var cartItems: Int
    var body: some View {
        ZStack {
            Image("cart")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: 100)
                .offset(x: 30, y: 10)
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(maxWidth: 30)
                Text("\(cartItems)")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
            }
            .offset(x: 45.0, y: 20)
            .opacity(cartItems > 0 ? 1.0 : 0)
        }
    }
}

struct CategoryView: View {
    var category: Category
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(width: 150.0, height: 150.0)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                Text(category.name)
                    .fontWeight(.bold)
            }
            
            Image(category.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140)
                .cornerRadius(10.0)
                .offset(x: -5,y: -10)
        }
    }
}


struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
