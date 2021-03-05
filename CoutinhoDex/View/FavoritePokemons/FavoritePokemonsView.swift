//
//  FavoritePokemonsView.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 05/02/21.
//

import Foundation
import UIKit

class FavoritePokemonsView: UIView {
    
    lazy var favoritePokemonsTabBarItem: UITabBarItem = {
        var item: UITabBarItem = UITabBarItem()
        item.title = "Favorite"
        item.image = UIImage(systemName: "heart.fill")
        return item
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
