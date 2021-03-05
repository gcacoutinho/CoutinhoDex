//
//  FotoPokemon.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation

struct Sprite: Codable {
    let backFemale, backShinyFemale, backDefault, frontFemale,
        frontShinyFemale, backShiny, frontDefault, frontShiny: String?
    
    enum CodingKeys: String, CodingKey {
        case backFemale = "back_female"
        case backShinyFemale = "back_shiny_female"
        case backDefault = "back_default"
        case frontFemale = "front_female"
        case frontShinyFemale = "front_shiny_female"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
