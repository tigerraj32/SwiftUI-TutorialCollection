//
//  Menu.swift
//  SwiftUI-WWDC19
//
//  Created by Rajan Twanabashu on 9/25/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import Foundation

struct WWDC2019Tutorial: Codable, Identifiable, Equatable {
    let id =  UUID()
    var name: String
    var tag: String
    var hasVideo:Bool = false
    var hasSourceCode = false
    var index: Int
}


let tutorialList = [
    WWDC2019Tutorial(name: "Introducing SwiftUI: Building Your First App", tag: "SwiftUI", hasVideo: true, hasSourceCode: true, index: 0),
    WWDC2019Tutorial(name: "Context Menu", tag: "Menu, SwiftUI", hasVideo: false, hasSourceCode: true, index: 1),
    WWDC2019Tutorial(name: "State Management", tag: "@State, @Binding, ObservableObject, @Publish", hasVideo: false, hasSourceCode: true, index: 2),
    WWDC2019Tutorial(name: "Enviroment Object Management", tag: "ObservableObject, @Publish, @EnviromentalObject", hasVideo: false, hasSourceCode: true, index: 3),
    WWDC2019Tutorial(name: "Custom View Modifier", tag: "ViewModifier, SwiftUI", hasVideo: false, hasSourceCode: true, index: 4)
]


