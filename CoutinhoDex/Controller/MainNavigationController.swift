//
//  MainNavigationController.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 05/02/21.
//

import Foundation
import UIKit

class MainNavigationController: UINavigationController {
    
    init() {
        super.init(rootViewController: MainTabBarController())
        self.isToolbarHidden = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
