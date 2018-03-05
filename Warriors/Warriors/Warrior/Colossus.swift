//
//  Colossus.swift
//  Warriors
//
//  Created by thomas bouges on 18-02-22.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation

class Colossus: Warrior{
    
    var typeAttac: String
    
    init(name: String) {
        
        self.typeAttac = "strike"
        super.init(name: name,power: 100,weapon: Axe())
        
    }
    
    
}

