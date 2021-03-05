//
//  Species.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation

struct Species: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
}
