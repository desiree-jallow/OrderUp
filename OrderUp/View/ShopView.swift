//
//  ShopView.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopView: View {
    @State private var category = ShopCategory()
    @State private var cartItems = 0
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
                .navigationBarItems(trailing: CartView(cartItems: cartItems))
                
            }
            
            ItemsView(category: category)
                .contentShape(Rectangle())
                .onTapGesture {
                    showCartItem()
                    print(cartItems)
                }
        }
        
    }
    
    
    private func showCartItem() {
        cartItems = shopItems.reduce(0, {$0 + $1.count})

    }
    
    
    
}


struct ItemsView: View {

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

                
                DescriptionView(item: item)
                
        
            }
            
        })
        
    }
    
    private func showItems(category: ShopCategory) -> [ShopItem] {
        var items = [ShopItem]()
        switch category.categoryName {
        case "Hats":
            items = shopItems.filter {$0.itemCategory == "Hats"}
        case "Shoes":
            items = shopItems.filter {$0.itemCategory == "Shoes"}
        case "Jewelry":
            items = shopItems.filter {$0.itemCategory == "Jewelry"}
        case "Dresses":
            items = shopItems.filter {$0.itemCategory == "Dresses"}
        
        default:
            break
        }
       return items
    }

        
}

struct DescriptionView: View {

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
                    
                    ToggleView(item: shopItems[item.id])
                        
                        
                        
                }
                .contentShape(Rectangle())
                .padding(.bottom)
               
            }
            .frame(width: UIScreen.main.bounds.width / 1.75)
        }
        
    
        
    }
    

}

struct ToggleView: View {
    @State var items = shopItems
    var item: ShopItem
    var body: some View {
      
        if items[item.id].count < 1 {
                ButtonView()
                    .onTapGesture {
                        items[item.id].count += 1
                        shopItems[item.id].count += 1
                        
                       
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
                                if items[item.id].count > 0 {
                                    items[item.id].count -= 1
                                    shopItems[item.id].count -= 1
                                }
                            }
                        
                        Text("\(items[item.id].count)")
                            .fontWeight(.bold)
                        
                        Text("+")
                            .fontWeight(.bold)
                            .padding(.all, 6)
                            .foregroundColor(.red)
                            .background(Circle())
                            .foregroundColor(.white)
                            .onTapGesture {
                                items[item.id].count += 1
                                shopItems[item.id].count += 1
                                
                            }
                    }
                    
                }
                .padding(.leading)
                .offset(x: 8, y: 5)
                .opacity(shopItems[item.id].count < 1 ? 0 : 1)
                .contentShape(Rectangle())
            }
        
        }

    }

struct ButtonView: View {
    
    var body: some View {
        Text("add to cart")
            .padding(.all, 6.0)
            .foregroundColor(.white)
            .font(.body)
            .background(Rectangle())
            .cornerRadius(10)
            .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .contentShape(Rectangle())
            .foregroundColor(.red)
            .offset(x: 10, y: 5)
           
        
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
                .offset(x: 40, y: 10)
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
    var category: ShopCategory
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(width: 150.0, height: 150.0)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                Text(category.categoryName)
                    .fontWeight(.bold)
            }
            
            Image(category.imageName!)
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

