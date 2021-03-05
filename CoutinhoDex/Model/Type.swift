//
//  Tipo.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation

struct Type: Codable {
    let name: String
    let url: String
    let slot: Int
    private let type: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case name, url, slot, type
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        slot = try values.decode(Int.self, forKey: .slot)
        type = try values.decode([String: String].self, forKey: .type)
        name = type["name"] ?? ""
        url = type["url"] ?? ""
    }
}
