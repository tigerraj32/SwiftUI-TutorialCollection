//
//  ContentView.swift
//  RestCallView
//
//  Created by Rajan Twanabashu on 10/18/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

struct TestModel: Decodable {
    var url: String?
}

struct District: Decodable {
    let id, eng, nep: String
}

struct State: Decodable {
    let id: String
    let district: [District]
}

class NetworkManager: ObservableObject {
    @Published var testModel:TestModel = TestModel()
    @Published var states: [State] = [State]()
    init() {
        
        getCources()
        getTestModel()
    }
    
    func getCources() {
        guard let url = URL(string: "https://bit.ly/2MOxqA4") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                //let json = try JSONSerialization.jsonObject(with: data, options: [])
                //print(json)
                
                let todos = try JSONDecoder().decode([State].self, from: data)
                DispatchQueue.main.async {
                    self.states = todos
                    print(self.states)
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
    func getTestModel() {
        guard let url = URL(string: "https://postman-echo.com/get") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let todos = try JSONDecoder().decode(TestModel.self, from: data)
                DispatchQueue.main.async {
                    self.testModel = todos
                    print(self.testModel)
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
    
}
public struct RestCallView: View {
    @ObservedObject var networkData: NetworkManager = NetworkManager()
    
    public init() {}
    
    public var body: some View {
        VStack{
            Text(self.networkData.testModel.url ?? "Fetching Data")
            List {
                ForEach(networkData.states, id: \.id.self) { state in
                    Section(header: Text("State \(state.id)")) {
                        ForEach(state.district, id: \.id.self) { district in
                            HStack{
                                Text(district.eng)
                                Divider()
                                Text(district.nep)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        RestCallView().environmentObject(NetworkManager())
    }
}
