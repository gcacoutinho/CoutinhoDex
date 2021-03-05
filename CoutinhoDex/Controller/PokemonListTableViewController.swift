//
//  PokemonListViewController.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class PokemonListTableViewController: UITableViewController {
    
    private let api: PokeAPI = API()
    private var pokemonList: [PokemonListItem] = []
    
    override func viewDidLoad() {
        api.getPokemonList(limit: 10, offset: 0) { data in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(PokemonList.self, from: data) else {
                return
            }
            self.pokemonList = response.results
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemonListItem = pokemonList[indexPath.row]
        let pokemonId = pokemonListItem.url.split(separator: "/").last?.base ?? ""
        
        let genericCell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath)
        
        guard let cell = genericCell as? PokemonTableViewCell else {
            return PokemonTableViewCell()
        }
        
        cell.startSkeleton()
        cell.pokemonId = pokemonId
        cell.delegate = self
        
        return cell
    }
    
}

extension PokemonListTableViewController
