//
//  RatingView.swift
//  SwiftUI-WWDC19
//
//  Created by Rajan Twanabashu on 10/1/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    @Binding var rate:Int
    
    var body: some View {
        HStack {
            ForEach (1 ..< 6) { id in
                self.starButton(index: id)
            }
        }
    }
    
    func starButton(index:Int) -> some View {
        let imageName = index <= rate ? "star.fill" : "star"
        let color:Color = index <= rate ? .yellow : .gray
        
        return
            Button(action: {
                self.rate = index
            }) {
                Image(systemName:imageName)
                    .imageScale(.large)
                    .foregroundColor(color)
                    .frame(width:24, height: 24)
        }
    }
}


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rate: .constant(3))
    }
}
