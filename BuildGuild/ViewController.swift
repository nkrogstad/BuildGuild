//
//  ViewController.swift
//  BuildGuild
//
//  Created by Nick Krogstad on 10/18/16.
//  Copyright © 2016 BuildGuild. All rights reserved.
//

import UIKit
import PokemonKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PokemonKit.fetchPokemon("409")
            .then { pokemonInfo in
                let imageStr = pokemonInfo.sprites?.frontShiny
                self.testLabel.text = pokemonInfo.name
                if let url = NSURL(string: imageStr!) {
                    if let data = NSData(contentsOfURL: url) {
                        self.testImage.image = UIImage(data: data)
                    }        
                }
                print()
            }.onError {error in
                print(error)
        }
        
        //PokemonKit.fetchPokemons()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

