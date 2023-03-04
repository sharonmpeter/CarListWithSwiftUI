//
//  DataManager.swift
//  CodingInterview
//
//  Created by Sharon Peter on 22/02/23.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private init(){}
    
    func loadData(car:String) -> [CarList] {
        guard let url = Bundle.main.url(forResource: car, withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([CarList].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
            return []
        }
    }
}
