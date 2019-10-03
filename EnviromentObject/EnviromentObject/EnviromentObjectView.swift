//
//  EnviromentObjectView.swift
//  SwiftUI-WWDC19
//
//  Created by Rajan Twanabashu on 10/2/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

struct B: View {
    @EnvironmentObject var setting: Setting
    
    var body: some View {
        VStack{
            Text("This is what we got from TextField")
            Text(setting.name)
        }
        
    }
}

struct A: View {
    var body: some View {
        NavigationLink(destination: B()) {
            Text("Show View B")
        }
    }
}

public class Setting: ObservableObject {
    @Published var name: String = ""
    public init() {}
}

public struct EnviromentObjectView: View {
    @EnvironmentObject var setting: Setting
    public init() {}
    public var body: some View {
        
        VStack {
            Text(setting.name)
            Group {
                TextField("Enter Name", text: $setting.name)
                    .foregroundColor(.green)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            NavigationLink(destination: A()) {
                Text("Show View A")
            }
        }.padding()
    }
    
}

struct EnviromentObjectView_Previews: PreviewProvider {
    static let setting = Setting()
    static var previews: some View {
        EnviromentObjectView().environmentObject(setting)
    }
}
