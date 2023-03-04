//
//  CarListModel.swift
//  CodingInterview
//
//  Created by Sharon Peter on 14/02/23.
//

import Foundation

// MARK: - CarList
struct CarList: Codable {
    let consList: [String]
    let customerPrice: Int
    let make: String
    let marketPrice: Int
    let model: String
    let prosList: [String]
    let rating: Int
}

