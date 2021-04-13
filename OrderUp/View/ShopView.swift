//
//  ShopView.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopView: View {
    @State private var category = ShopCategory()
    @StateObject private var myItem = Item()
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
            
            ItemsView(myItem: myItem, category: category)
                
        }
        
    }
    
    
    private func showCartItem() -> Int {
        return myItem.shopItems.reduce(0, {$0 + $1.count})

    }
    
    
    
}


struct ItemsView: View {
    @ObservedObject var myItem: Item

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

                
                DescriptionView(myItem: myItem, item: item)
                
        
            }
            
        })
        
    }
    
    private func showItems(category: ShopCategory) -> [ShopItem] {
        var items = [ShopItem]()
        switch category.categoryName {
        case "Hats":
            items = myItem.shopItems.filter {$0.itemCategory == "Hats"}
        case "Shoes":
            items = myItem.shopItems.filter {$0.itemCategory == "Shoes"}
        case "Jewelry":
            items = myItem.shopItems.filter {$0.itemCategory == "Jewelry"}
        case "Dresses":
            items = myItem.shopItems.filter {$0.itemCategory == "Dresses"}
        
        default:
            break
        }
       return items
    }

        
}

struct DescriptionView: View {
    @ObservedObject var myItem: Item
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
                    
                    ToggleView(myItem: myItem, item: myItem.shopItems[item.id])
                        
                        
                        
                }
                .contentShape(Rectangle())
                .padding(.bottom)
               
            }
            .frame(width: UIScreen.main.bounds.width / 1.75)
        }
        
    
        
    }
    

}

struct ToggleView: View {
    @ObservedObject var myItem: Item
    var item: ShopItem
    var body: some View {
      
        if myItem.shopItems[item.id].count < 1 {
                ButtonView()
                    .onTapGesture {
                        myItem.shopItems[item.id].count += 1
//                        shopItems[item.id].count += 1
                        
                       
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
                                if myItem.shopItems[item.id].count > 0 {
                                    myItem.shopItems[item.id].count -= 1
//                                    shopItems[item.id].count -= 1
                                    
                                }
                            }
                        
                        Text("\(myItem.shopItems[item.id].count)")
                            .fontWeight(.bold)
                        
                        Text("+")
                            .fontWeight(.bold)
                            .padding(.all, 6)
                            .foregroundColor(.red)
                            .background(Circle())
                            .foregroundColor(.white)
                            .onTapGesture {
                                myItem.shopItems[item.id].count += 1
//                                shopItems[item.id].count += 1
                            
                                
                            }
                    }
                    
                }
                .padding(.leading)
                .offset(x: 8, y: 5)
                .opacity(myItem.shopItems[item.id].count < 1 ? 0 : 1)
                .contentShape(Rectangle())
            }
        
        }

    }

class Item : ObservableObject {
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

