//
//  Pkmn.swift
//  BuildGuild
//
//  Created by Nick Krogstad on 10/19/16.
//  Copyright © 2016 BuildGuild. All rights reserved.
//

import Foundation
import PokemonKit

class Pkmn {
    
    // MARK: Properties
    
    var name: String
    var sprite: UIImage?
    
    // MARK: Initializer
    
    init?(name: String, sprite: UIImage?) {
        
        // Initialize stored properties.
        self.name = name
        self.sprite = sprite
        
        // Initialization fails if there is no name.
        if name.isEmpty {
            return nil
        }
    }
}