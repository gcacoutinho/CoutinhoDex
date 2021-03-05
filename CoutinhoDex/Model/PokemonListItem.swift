//
//  PokemonListItem.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 07/02/21.
//

import Foundation

struct PokemonListItem: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try! values.decode(String.self, forKey: .name)
        url = try! values.decode(String.self, forKey: .url)
        
    }
}
