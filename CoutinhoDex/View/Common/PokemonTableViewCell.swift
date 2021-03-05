//
//  PokemonTableViewCell.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 05/02/21.
//

import Foundation
import UIKit
import SkeletonView

import Alamofire
import AlamofireImage

protocol PokemonTableViewCellDelegate {
    func fetchPokemonInfo(by id: Int,
                          completionHandler: @escaping (_ name: String?,
                                                        _ types: [String]?) -> Void)
    func fetchPokemonImage(by id: Int,
                           completionHandler: @escaping (_ image: UIImage?) -> Void)
}

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    
    static let identifier = "PokemonListCell"
    
    var pokemonId: String?
    var delegate: PokemonTableViewCellDelegate?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        guard pokemonId != nil,
              !(pokemonId!.isEmpty),
              let intId = Int(pokemonId!) else {
            super.removeFromSuperview()
            return
        }
        
        setPokemonIdLabel(intId)

        self.delegate?.fetchPokemonInfo(by: intId) { [self] (name, types) in
            setNameLabel(name)
            setTypesLabel(types)
        }
        
        self.delegate?.fetchPokemonImage(by: intId) { requestedImage in
            self.pokemonImageView.image = requestedImage // ?? defaultImage
            self.pokemonImageView.hideSkeleton()
        }
    }
    
    func startSkeleton() {
        pokemonImageView.showAnimatedGradientSkeleton()
        numberLabel.showAnimatedGradientSkeleton()
        nameLabel.showAnimatedGradientSkeleton()
        typesLabel.showAnimatedGradientSkeleton()
    }
    
    private func setPokemonIdLabel(_ id: Int) {
        let idPadded = String(format: "%03d", id)
        self.numberLabel.text = "#\(idPadded)"
        self.numberLabel.hideSkeleton()
    }
    
    private func setNameLabel(_ name: String?) {
        let name = name != nil ? name! : "-"
        self.nameLabel.text = name.capitalized
        self.nameLabel.hideSkeleton()
    }
    
    private func setTypesLabel(_ types: [String]?) {
        let typesCap = types?.map({ $0.capitalized })
        let typesJoined = types != nil ? typesCap!.joined(separator: "/") : "-"
        self.typesLabel.text = typesJoined
        self.typesLabel.hideSkeleton()
    }
}
