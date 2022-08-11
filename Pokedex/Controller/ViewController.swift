//
//  ViewController.swift
//  Pokedex
//
//  Created by Adin Joyce on 8/11/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var pokedexManager = PokedexManager()
    
    var pokedex = [(String, String)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pokedexManager.delegate = self
        collectionView.dataSource = self
        
        pokedexManager.getData()
    }
}

// MARK: - Collection View Data Source Methods

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        
        cell.pokemonImageView.loadFrom(URLAddress: pokedex[indexPath.row].1)
        cell.layer.cornerRadius = cell.frame.size.width / 2
        cell.clipsToBounds = true
        cell.backgroundColor = .white
        cell.dropShadow(color: .black, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 4, scale: true)
        
        return cell
    }
}

// MARK: - Pokemon Manager Delegate Methods

extension ViewController: PokedexManagerDelegate {
    func didGetData(_ pokedex: [(String, String)]) {
        DispatchQueue.main.async {
            self.pokedex = pokedex
            self.collectionView.reloadData()
        }
    }
}

// MARK: - View Extension

extension UIView {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.cornerRadius = layer.frame.size.width / 2
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
}

// MARK: - Image View Extension

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

