//
//  ShopView.swift
//  OrderUp
//
//  Created by Desiree on 3/12/21.
//

import SwiftUI

struct ShopView: View {
    @State private var cartItems: Dictionary<Int,ShopItem> = [:]
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
                .navigationBarItems(trailing: CartView(cartItems: cartItems.count))
            }
            
            ItemsView(inCart: true)
            
            
        }
        
    }
}

struct ItemsView: View {
    var inCart: Bool
    var body: some View {
        HStack {
            
            Text("Hats")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.leading)
            Spacer()
        }
        
        List(shopItems) { item in
            VStack {
                HStack(alignment: .top) {
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .background(RoundedRectangle(cornerRadius: 10), alignment: .center)
                        .foregroundColor(.gray)
//                        .position(x: 110, y: 75)
                    
                    DescriptionView(item: item)
                    
                }
                
            }
            
        }
        
    }
    
}

struct DescriptionView: View {
    @State var showStepper = false
    @State var stepperValue = 1
    var item: ShopItem
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                Text(item.name)
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
                  
                
                if !showStepper {
                    ButtonView()
                        .opacity(showStepper ? 0 : 1)
                        .padding(.trailing, 2)
                        .onTapGesture {
                            showStepper = true
                        }
                } else {
                    StepperView()
                   
                }
                   
                    
            }
            .padding(.bottom)

        }
        
        .frame(width: UIScreen.main.bounds.width / 1.75)
    }
    
}

struct StepperView: View {
    @State var button = ButtonView()
    @State var stepperValue: Int = 1
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                        if stepperValue > 0 {
                            stepperValue -= 1
                        }
                    }
                
                Text("\(stepperValue)")
                    .fontWeight(.bold)
                
                Text("+")
                    .fontWeight(.bold)
                    .padding(.all, 6)
                    .foregroundColor(.red)
                    .background(Circle())
                    .foregroundColor(.white)
                    .onTapGesture {
                        stepperValue += 1
                    }
            }
            
        }
        .padding(.leading)
        .padding(.top)
        .opacity(stepperValue < 1 ? 0 : 1)
        
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
            .frame(width: 120, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
            .offset(x: 10, y: 10)
        
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
