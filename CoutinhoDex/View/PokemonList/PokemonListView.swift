//
//  PokemonListView.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 05/02/21.
//

import Foundation
import UIKit

class PokemonListView: UIView {
    
    lazy var pokemonListTabBarItem: UITabBarItem = {
        var item: UITabBarItem = UITabBarItem()
        item.title = "List"
        item.image = UIImage(systemName: "list.bullet")
        return item
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(PokemonTableViewCell.self,
                      forCellReuseIdentifier: PokemonTableViewCell.identifier)
        return view
    }()
    
    init() {
        super.init(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                 size: CGSize(width: 200, height: 100)))
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
            tableView.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 1),
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1),
            tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 1)
        ])
    }
}
