//
//  FavoritePokemonsViewController.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 05/02/21.
//

import Foundation
import UIKit

class FavoritePokemonsViewController: UIViewController {
    
    let mainView = FavoritePokemonsView()
    let api: PokeAPI = API()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = mainView.favoritePokemonsTabBarItem
        self.view = mainView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
