//
//  ContentView.swift
//  SwiftUI-WWDC
//
//  Created by Rajan Twanabashu on 10/4/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI
import WWDC19_Intro
import StateManagement
import Published_ObservedObject
import EnviromentObject
import ContextualMenu
import CustomViewModifier
import BarChartView
import RestCallView

struct ContentView: View {
    
    var tutorials: [WWDC2019Tutorial] = tutorialList
    
    var body: some View {
        
        NavigationView {
            List(tutorials) { item in
                
                NavigationLink(destination: self.viewSelector(item: item)) {
                    TutorialCell(item: item)
                }
                
                
                
            }
            .navigationBarTitle("WWDC 2019 ")
        }
        
    }
    
    
    func viewSelector(item: WWDC2019Tutorial) -> AnyView {
        
        switch item.index {
            
        case 0:
            return AnyView(HeritageView())
        case 1:
            return AnyView(ContextualMenu())
        case 2:
            return AnyView(ParentView())
        case 3:
            return AnyView(EnviromentObjectView())
            
        case 4:
            return AnyView(CustomViewModifier())
        case 5:
            return AnyView(BarView())
        case 6:
            return AnyView(RestCallView())
        default:
            return AnyView(Text("Hope you are finding this tutorial userful"))
            
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    //static let setting = Setting()
    static var previews: some View {
        ContentView()
        //ContentView(tutorials: tutorialList).environmentObject(setting)
    }
}


struct TutorialCell: View {
    var item: WWDC2019Tutorial
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.headline)
                .fontWeight(.bold)
            HStack {
                Text(item.tag)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                if item.hasVideo {
                    Image(systemName: "video")
                }
                
                if item.hasSourceCode {
                    Image(systemName: "chevron.left.slash.chevron.right").font(.subheadline)
                }
                
                
            }
            
        }
    }
}
