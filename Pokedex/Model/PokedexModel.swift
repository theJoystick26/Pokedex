//
//  PokedexModel.swift
//  Pokedex
//
//  Created by Adin Joyce on 8/11/22.
//

import Foundation

struct PokedexModel: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
}
