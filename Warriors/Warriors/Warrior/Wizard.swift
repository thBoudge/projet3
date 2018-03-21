//
//  Wizard.swift
//  Warriors
//
//  Created by thomas bouges on 18-02-22.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation

class Wizard: Warrior{
    
    var typeAttac: String
    
    init(name: String) {
        self.typeAttac = "treat"
        super.init(name: name,power: 70, weapon: Treat())
    }
    
    override func strike(warrior: Warrior) {
        print("I cannot attack")
    }
    
    override func treatWarrior(warrior: Warrior) ->Void {
        warrior.power += warriorWeapon.powerWeapon
        print("\n\n-----------------------------------------------------------------------")
        print("wariors \(warrior.name) have been treat power level is now: \(warrior.power)")
        print("-----------------------------------------------------------------------\n\n")
   }
    
}


