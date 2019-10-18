//
//  RowIdentificationView.swift
//  BarChartView
//
//  Created by Rajan Twanabashu on 10/4/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

struct CellObject: Identifiable {
    var id = UUID()
    var name: String = ""
    var star: Bool = false
    
}

class ListData: ObservableObject {
    @Published var data: [CellObject] = [
        CellObject(name: "Rajan 1"),
        CellObject(name: "Rajan 2"),
        CellObject(name: "Rajan 3", star: true),
        CellObject(name: "Rajan 4"),
        CellObject(name: "Rajan 5")
    ]
}

struct RowIdentificationView: View {
    
    @ObservedObject var listData = ListData()
    
    var body: some View {
        NavigationView {
            List(listData.data) { item in
                Cell(listData: self.listData, item: item)
            }
        }
    }
}

struct RowIdentificationView_Previews: PreviewProvider {
    static var previews: some View {
        RowIdentificationView()
    }
}


struct Cell: View {
    @ObservedObject var listData : ListData
    var item: CellObject
    
    var itemIndex: Int {
        listData.data.firstIndex(where: { $0.id == item.id })!
    }
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Button(action: {self.listData.data[self.itemIndex].star.toggle()}) {
                Image(systemName: item.star ? "star.fill" : "star")
                    .imageScale(.large)
            }
            
        }
        .padding()
        
    }
    
    
}

