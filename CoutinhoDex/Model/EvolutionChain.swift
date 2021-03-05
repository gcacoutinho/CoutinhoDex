//
//  CadeiaEvolucao.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation

struct EvolutionChain: Decodable {
    let id: Int
    let chain: Chain
    
    enum CodingKeys: String, CodingKey {
        case id, chain
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        chain = try values.decode(Chain.self, forKey: .chain)
    }
}
