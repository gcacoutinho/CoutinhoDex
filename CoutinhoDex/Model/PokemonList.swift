//
//  PokemonList.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 07/02/21.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonListItem]
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        count = try! values.decode(Int.self, forKey: .count)
//        next = try! values.decode(String.self, forKey: .next)
//        previous = try! values.decode(String.self, forKey: .previous)
//        results = try! values.decode([PokemonListItem].self, forKey: .results)
//    }
}
