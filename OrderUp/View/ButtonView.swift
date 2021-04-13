//
//  ButtonView.swift
//  OrderUp
//
//  Created by Desiree on 4/13/21.
//

import SwiftUI

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
