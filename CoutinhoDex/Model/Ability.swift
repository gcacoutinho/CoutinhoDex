//
//  HabilidadePokemon.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation

struct Ability: Codable {
    let isHidden: Bool
    let slot: Int
    let name: String
    let url: String
    private let ability: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case name, url, slot, ability
        case isHidden = "is_hidden"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        isHidden = try values.decode(Bool.self, forKey: .isHidden)
        slot = try values.decode(Int.self, forKey: .slot)
        ability = try values.decode([String: String].self, forKey: .ability)
        name = ability["name"] ?? ""
        url = ability["url"] ?? ""
    }
}
