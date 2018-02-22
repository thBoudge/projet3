//
//  Team.swift
//  Warriors
//
//  Created by thomas bouges on 18-02-21.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation

class Team {
    
    var teamName: String
    var warriorTeam: Array<Warrior> = []
    
    init(teamName:String,warrior1: Warrior,warrior2:Warrior,warrior3:Warrior){
        
        self.teamName=teamName
        self.warriorTeam.append(warrior1)
        self.warriorTeam.append(warrior2)
        self.warriorTeam.append(warrior3)
        
    }
    
    func ShowTeam() -> Void{
        
        print("\(self.teamName)")
        for i in 0...2{
            print( "\n \(self.warriorTeam[i].name)   \(self.warriorTeam[i].power) \(self.warriorTeam[i].warriorWeapon.nameWeapon) \(self.warriorTeam[i].warriorWeapon.powerWeapon)\n")
        }
        

    }
    
}

