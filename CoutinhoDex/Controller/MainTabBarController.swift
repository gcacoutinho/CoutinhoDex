//
//  MainTabBarController.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = [
            PokemonListViewController(),
            FavoritePokemonsViewController()
            
        ]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
