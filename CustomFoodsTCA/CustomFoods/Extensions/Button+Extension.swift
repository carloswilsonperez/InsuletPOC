//
//  Button+Extension.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 20/01/22.
//

import SwiftUI

struct ButtonStyleReusable: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: 300, maxHeight: 20)
            .padding()
            .foregroundColor(Color.white)
            .background(color)
            .cornerRadius(8)
    }
}

extension Button {
    func buttonStyleReusable(withBackground color: Color) -> some View {
        self.modifier(ButtonStyleReusable(color: color))
    }
}
