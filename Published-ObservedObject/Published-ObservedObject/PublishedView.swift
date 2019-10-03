//
//  DynamicListView.swift
//  SwiftUI-WWDC19
//
//  Created by Rajan Twanabashu on 10/2/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

class Person: ObservableObject {
    let name: String = "Rajan"
    @Published var friendsCount: Int = 0
}

public struct PublishedView: View {
    @ObservedObject var person: Person = Person()
    
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Name: \(person.name)")
            Text("No of friends: \(person.friendsCount)")
            Button(action: {
                self.person.friendsCount += 1
            }){
                Text("Add Friend")
            }
        }
        
    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedView()
    }
}
