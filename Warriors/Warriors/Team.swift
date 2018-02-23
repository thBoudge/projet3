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
    //tableau objet
    var warriorTeam = [Warrior]()
    
    init(teamName:String){
        
        self.teamName=teamName
       

        
    }
    
    func showTeam() -> Void{
        
        print("\(self.teamName)")
        for i in 0...2{
            print( "\n \(self.warriorTeam[i].name)   \(self.warriorTeam[i].power) \(self.warriorTeam[i].warriorWeapon.nameWeapon) \(self.warriorTeam[i].warriorWeapon.powerWeapon)\n")
        }
        

    }
    
    
    func createWarrior(){
        
        var choice: String
        var nameWarrior: String
        print("Choix des combatants : \n"
            + " 1- Combattant Vie: , Arme: Épée, Valeur des coups: 10\n"
            + " 2- Colosse Vie: , Arme: Épée, Valeur des coups: 10\n"
            + " 3- Nain    Vie: , Arme: Épée, Valeur des coups: 10\n"
            + " 4- Mage    Vie: , Arme: Épée, Valeur des coups: 10\n"
        )
        
       print("faite votre choix :   ")
      
        // if verifier l optionnel si pas Nil cours deballage + 1234
        
        choice = readLine()!
        
        print("Nom du Warrior :   ")
        
        // if verifier l optionnel si pas Nil cours deballage + 1234
        
        nameWarrior = readLine()!
        
        switch choice {
        case "1":
            warriorTeam.append(Combattant(name: nameWarrior))
        case "2":
            warriorTeam.append(Colosse(name: nameWarrior))
        case "3":
            warriorTeam.append(Nain(name: nameWarrior))
        case "4":
            warriorTeam.append(Mage(name: nameWarrior))
        default:
            print("saisir un chiffre entre 1 et 4")
        }
        
    
}


}

