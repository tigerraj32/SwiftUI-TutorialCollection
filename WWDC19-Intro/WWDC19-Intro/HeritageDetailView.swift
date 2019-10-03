//
//  HeritageDetailView.swift
//  SwiftUI-WWDC19
//
//  Created by Rajan Twanabashu on 9/25/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

struct HeritageDetailView: View {
    
    @State private var isZoomed: Bool = false
    
    var site: Site
    var body: some View {
        VStack {
            Image(site.imageName)
                .resizable()
                .aspectRatio(contentMode: isZoomed ? .fill : .fit)
                .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .onTapGesture {
                    
                    withAnimation() {
                        self.isZoomed.toggle()
                    }
                    
            }
            
            if !isZoomed {
                VStack(alignment: .leading) {
                    Text(site.address)
                        .foregroundColor(.secondary)
                        .offset(x: 0, y: -10)
                    
                    Divider()
                    Text(site.shortDescription)
                   
                }
                .padding()
                .transition(.move(edge: .leading))
                Spacer()
            }
            
        }.navigationBarTitle(Text(site.name), displayMode: .inline)
        
    }
}

struct HeritageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HeritageDetailView(site: Heritage.testData[0])
        }
        
    }
}
