//
//  SwiftUIView.swift
//  SwiftUI-WWDC19
//
//  Created by Rajan Twanabashu on 10/1/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

/*
 
 SwiftUI gives us the ContextMenu modifier for creating popup menus in our apps. In iOS this is usually triggered using 3D Touch, but it works just the same as a right-click on macOS – it’s a flexible API.
 
 
 
 */

public struct ContextualMenu: View {
    public init() {}
    
    public var body: some View {
        VStack {
            
            Text("Long tap or  3D touch on option or row below.")
                .padding(.bottom)
            
            Text("Options")
                .contextMenu {
                    Button(action: {
                        // change country setting
                    }) {
                        Text("Choose Country")
                        Image(systemName: "globe")
                    }
                    
                    Button(action: {
                        // enable geolocation
                    }) {
                        Text("Detect Location")
                        Image(systemName: "location.circle")
                    }
            }
            
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Text("Hello")
                    .contextMenu {
                        Button(action: {
                            // change country setting
                        }) {
                            Text("Choose Country")
                            Image(systemName: "globe")
                        }
                        
                        Button(action: {
                            // enable geolocation
                        }) {
                            Text("Detect Location")
                            Image(systemName: "location.circle")
                        }
                }
            }
            
        }
         .navigationBarTitle(Text("Context Menu"), displayMode: .inline)
        
    }
}


struct ContextualMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextualMenu()
    }
}
