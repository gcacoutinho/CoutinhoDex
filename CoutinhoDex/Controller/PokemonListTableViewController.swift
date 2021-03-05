//
//  PokemonListViewController.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation
import UIKit

class PokemonListTableViewController: UITableViewController {
    
    private var currentPage: Int = 0
    private let limit: Int = 15
    
    let api: PokeAPI = API()
    var pokemonList: [PokemonListItem] = []
    
    override func viewDidLoad() {
        loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemonListItem = pokemonList[indexPath.row]
        let pokemonId = pokemonListItem.url.split(separator: "/").last ?? ""
        
        let genericCell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath)
        
        guard let cell = genericCell as? PokemonTableViewCell else {
            return PokemonTableViewCell()
        }
        
        cell.startSkeleton()
        cell.pokemonId = String(pokemonId)
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let nextpage = pokemonList.count - 3
        if indexPath.row == nextpage {
            loadData()
        }
    }

    private func loadData() {
        let offset = currentPage * limit
        api.getPokemonList(limit: limit, offset: offset) { data in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(PokemonList.self, from: data) else {
                return
            }
            self.pokemonList.append(contentsOf: response.results)
            self.currentPage += 1
            self.tableView.reloadData()
        }
    }
    
}
