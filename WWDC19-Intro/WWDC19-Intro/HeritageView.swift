//
//  HeritageView.swift
//  SwiftUI-WWDC19
//
//  Created by Rajan Twanabashu on 9/25/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

public struct HeritageView: View {
    
    let heritages = Bundle.main.decode([Heritage].self, from: "heritage.json")
    
    public init() {}
    
    public var body: some View {
        
        List {
            ForEach(heritages) { heritage in
                Section(header: Text(heritage.country)) {
                    ForEach(heritage.sites) { site in
                        HeritageCell(heritage: site)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Heritages"), displayMode: .inline)
        .listStyle(GroupedListStyle())
    }
}
    
    struct HeritageView_Previews: PreviewProvider {
        static var previews: some View {
            HeritageView()
        }
    }
    
    struct HeritageCell: View {
        let heritage: Site
        var body: some View {
            NavigationLink(destination: HeritageDetailView(site: heritage)) {
                Image(heritage.thumbnailName)
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
                    .cornerRadius(8)
                VStack(alignment: .leading){
                    Text(heritage.name)
                        .font(.headline)
                    Text(heritage.address)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
}
