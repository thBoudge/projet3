//
//  Warrior.swift
//  Warriors
//
//  Created by thomas bouges on 18-02-21.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation

class Warrior {
    
    var name:String
    var power:Int
    var warriorWeapon: Weapon
    
    init(name:String,power:Int,weapon: Weapon){
        self.name = name
        self.power = power
        self.warriorWeapon = weapon
        
    }
    
    func strike (weapon:Weapon, warrior: Warrior)->Void {
        
        warrior.power -= weapon.powerWeapon
        print("\(warrior.name)have been attacked with an \(weapon.type)")
        print("\(warrior.name) is now \(warrior.power)")
        
    }
    
    
}


