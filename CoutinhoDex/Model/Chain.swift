//
//  Cadeia.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation

protocol ChainLink: Decodable { }

struct Chain: ChainLink {
    let isBaby: Bool
    let species: Species
    let evolutionDetails: [String]?
    let evolvesTo: ChainLink?
    
    enum CodingKeys: String, CodingKey {
        case isBaby, species, evolutionDetails, evolvesTo
    }
    
    init(from decoder: Decoder) throws {
        isBaby = false
        species = Species(name: "", url: "")
        evolutionDetails = nil
        evolvesTo = nil
    }
}
