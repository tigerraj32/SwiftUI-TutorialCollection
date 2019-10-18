//
//  BarChartView.swift
//  BarChartView
//
//  Created by Rajan Twanabashu on 10/4/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

public struct BarView: View {
    @State var selectedSegment: Int = 0
    @State var dataPoints: [[CGFloat]] = [
        [12,30, 40, 50, 60, 45, 90],
        [120, 40, 40, 60, 70, 85, 60],
        [12,30, 140, 50, 110, 45, 70]
    ]
    
    public init() {}
    public var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Swift UI Bar Chart").fontWeight(.heavy)
                Picker(selection: $selectedSegment, label: Text("")) {
                    Text("Option 1").tag(0)
                    Text("Option 2").tag(1)
                    Text("Option 3").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack(spacing: 20) {
                    Bar(value: dataPoints[selectedSegment][0], labelX: "Sun")
                    Bar(value: dataPoints[selectedSegment][1], labelX: "Mon")
                    Bar(value: dataPoints[selectedSegment][2], labelX: "Tue")
                    Bar(value: dataPoints[selectedSegment][3], labelX: "Wed")
                    Bar(value: dataPoints[selectedSegment][4], labelX: "Thu")
                    Bar(value: dataPoints[selectedSegment][5], labelX: "Fri")
                    Bar(value: dataPoints[selectedSegment][6], labelX: "Sat")
                }
                .padding()
                .animation(.default)
                
            }
        }
        
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarView().environment(\.colorScheme, .light)
            //BarView().environment(\.colorScheme, .dark)
        }
        
    }
}

struct Bar: View {
    var value: CGFloat
    var labelX: String
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(labelX).fontWeight(.light).font(.system(size: 10))
        }
    }
}
