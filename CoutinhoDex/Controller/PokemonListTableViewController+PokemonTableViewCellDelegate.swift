//
//  PokemonListTableViewController+PokemonTableViewCellDelegate.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 04/03/21.
//

import Foundation
import UIKit

extension PokemonListTableViewController: PokemonTableViewCellDelegate {
    func fetchPokemonInfo(by id: Int,
                          completionHandler: @escaping (_ name: String?,
                                                        _ types: [String]?) -> Void) {
        api.getPokemon(by: id) { data in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            guard let pokemon = try? decoder.decode(Pokemon.self, from: data) else {
                return
            }
            
            let types = pokemon.types.map { $0.name }
            
            completionHandler(pokemon.name, types)
        }
        
    }
    
    func fetchPokemonImage(by id: Int,
                           completionHandler: @escaping (_ image: UIImage?) -> Void) {
        let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
        api.getPokemonImage(by: url) { data in
            completionHandler(data as? UIImage)
        }
    }
}

