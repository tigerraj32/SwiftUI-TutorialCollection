//
//  Heritage.swift
//  SwiftUI-WWDC19
//
//  Created by Rajan Twanabashu on 9/25/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import Foundation

class HeritageStore: ObservableObject {
    @Published var sites = [Site]()
    
   func add(site: Site) {
        sites.append(site)
    }

    func remove(site: Site) {
        if let index = sites.firstIndex(of: site) {
            sites.remove(at: index)
        }
    }
}

struct Heritage: Codable, Identifiable {
    
    var id: UUID
    var country: String
    var sites: [Site]
    
    #if DEBUG
    static let  testData = [
        Site(id: UUID(), name: "Bhaktapur Durbar Square", address: "Bhaktapur", shortDescription: "short Description", imageName: "Bhaktapur-Durbar")
    ]
    
    #endif
}

struct Site: Codable, Identifiable, Equatable {
    var id: UUID
    var name: String
    var address: String
    var shortDescription: String
    var imageName: String
    var thumbnailName: String {
        "\(imageName)-thumb"
    }
}



