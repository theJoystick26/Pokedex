//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Adin Joyce on 8/11/22.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func awakeFromNib() {
        pokemonImageView.image = UIImage(named: "pokeball")
    }
}
