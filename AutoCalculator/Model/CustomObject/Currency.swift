//
//  Currency.swift
//  AutoCalculator
//
//  Created by 강성찬 on 2023-06-16.
//

import Foundation

struct Currency: Codable {
    var success: Bool
    var base: String
    var date: String
    var rates = [String: Double]()
}


