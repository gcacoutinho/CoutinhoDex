//
//  Pokemon.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let sprites: Sprite
    let stats: [Stat]
    let abilities: [Ability]
    let types: [Type]
//    let evolutionChain: EvolutionChain
    
    enum CodingKeys: String, CodingKey {
        case id, name, sprites, stats, abilities, types
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        sprites = try values.decode(Sprite.self, forKey: .sprites)
        stats = try values.decode([Stat].self, forKey: .stats)
        abilities = try values.decode([Ability].self, forKey: .abilities)
        types = try values.decode([Type].self, forKey: .types)
        
    }
}
