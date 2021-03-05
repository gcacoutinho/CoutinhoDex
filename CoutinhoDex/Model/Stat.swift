//
//  EstatisticaPokemon.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation

struct Stat: Codable {
    let baseStat: Int
    let effort: Int
    let name: String
    let url: String
    private let stat: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case effort, name, url, stat
        case baseStat = "base_stat"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        baseStat = try values.decode(Int.self, forKey: .baseStat)
        effort = try values.decode(Int.self, forKey: .effort)
        stat = try values.decode([String: String].self, forKey: .stat)
        name = stat["name"] ?? ""
        url = stat["url"] ?? ""
    }
}
