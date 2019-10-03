//
//  CustomView.swift
//  SwiftUI-WWDC19
//
//  Created by Rajan Twanabashu on 10/3/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

public struct CustomViewModifier: View {
    public init() {}
    
    public var body: some View {
        HStack {
            
            Text("A")
                 .modifier(TextModifier(background: Color.red))
            
            Text("B")
                 .modifier(TextModifier(background: Color.green))
            
            Text("B")
                .modifier(TextModifier(background: Color.blue))
            
        }
    }
}


struct TextModifier: ViewModifier {
    var background = Color.red
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(background)
            .foregroundColor(Color.white)
            .clipShape(Circle())
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifier()
    }
}
