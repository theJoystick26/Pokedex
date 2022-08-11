//
//  ViewController.swift
//  Pokedex
//
//  Created by Adin Joyce on 8/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    let pokedexManager = PokedexManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pokedexManager.getData()
    }


}

