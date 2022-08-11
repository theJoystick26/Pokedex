//
//  ViewController.swift
//  Pokedex
//
//  Created by Adin Joyce on 8/11/22.
//

import UIKit

class ViewController: UIViewController {
    var pokedexManager = PokedexManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pokedexManager.delegate = self
        pokedexManager.getData()
    }
}

extension ViewController: PokedexManagerDelegate {
    func didGetData(_ pokedex: [(String, String)]) {
        print(pokedex)
    }
}

