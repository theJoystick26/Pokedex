//
//  PokedexManager.swift
//  Pokedex
//
//  Created by Adin Joyce on 8/11/22.
//

import Foundation

protocol PokedexManagerDelegate {
    func didGetData(_ pokedex: [(String, String)])
}

struct PokedexManager {
    private let urlString = "https://pokeapi.co/api/v2/pokemon?limit=1154"
    private let imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    var delegate: PokedexManagerDelegate?
    
    func getData() {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, reponse, error in
                guard let data = data, error == nil else {
                    print("Request failed.")
                    return
                }
                
                if let pokedex = parseJSON(with: data) {
                    delegate?.didGetData(pokedex)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(with data: Data) -> [(String, String)]? {
        var pokedex = [(String, String)]()
        
        do {
            let pokedexData = try JSONDecoder().decode(PokedexModel.self, from: data)
            
            for (index, result) in pokedexData.results.enumerated() {
                pokedex.append((result.name, imageUrl + "\(index + 1).png"))
            }
            
            return pokedex
        } catch {
            print("Error decoding data: \(error)")
        }
        
        return nil
    }
}
