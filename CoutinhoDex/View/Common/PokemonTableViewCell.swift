//
//  PokemonTableViewCell.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 05/02/21.
//

import Foundation
import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    static let identifier = "PokemonCell"
    
    // MARK: Atributos
    
    weak var requestedImage: UIImage? {
        didSet {
            self.pokemonImageView.image = requestedImage // ?? defaultImage
        }
    }
    
    var pokemonNumber: Int? {
        didSet {
            self.pokemonNumberLabel.text = pokemonNumber != nil ? String(pokemonNumber!) : "-"
        }
    }
    
    var pokemonName: String? {
        didSet {
            self.pokemonNameLabel.text = pokemonName != nil ? pokemonName! : "-"
        }
    }
    
    var pokemonType: [String]? {
        didSet {
            self.pokemonTypeLabel.text = pokemonType != nil ? pokemonType!.joined(separator: "/") : "-"
        }
    }
    
    // MARK: View
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
    private lazy var pokemonImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var infoStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .top
        return view
    }()
    
    private lazy var pokemonNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if let desc = label.font.fontDescriptor.withSymbolicTraits(.traitBold) {
            label.font = UIFont(descriptor: desc, size: 0.0)
        }
        return label
    }()
    
    private lazy var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pokemonTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Metodos
    
    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        infoStackView.addArrangedSubview(pokemonNumberLabel)
        infoStackView.addArrangedSubview(pokemonNameLabel)
        infoStackView.addArrangedSubview(pokemonTypeLabel)
        
        mainStackView.addArrangedSubview(pokemonImageView)
        mainStackView.addArrangedSubview(infoStackView)
        
        self.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
            mainStackView.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 1),
            mainStackView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 0.5),
            mainStackView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 0.5)
        ])
        
    }
}
