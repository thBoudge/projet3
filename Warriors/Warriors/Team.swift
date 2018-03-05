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
    
    //Method to show each team warrior and weapon
    func showTeam() -> Void{
        
        print("\(self.teamName)")
        for i in 0...2{
            print( "\n \(self.warriorTeam[i].name)   \(self.warriorTeam[i].power) \(self.warriorTeam[i].warriorWeapon.nameWeapon) \(self.warriorTeam[i].warriorWeapon.powerWeapon)\n")
        }
    }
    
    // method to create one new warrior
    func createWarrior(number : Int){
        var warrior: String
        
        var nameWarrior: String
        
        warrior = warriorSelected(number: number)
        
        nameWarrior = warriorname()
        
        switch warrior {
        case "1":
            warriorTeam.append(Fighter(name: nameWarrior))
        case "2":
            warriorTeam.append(Colossus(name: nameWarrior))
        case "3":
            warriorTeam.append(Dwarf(name: nameWarrior))
        case "4":
            warriorTeam.append(Wizard(name: nameWarrior))
        default:
            print("saisir un chiffre entre 1 et 4")
        }
        
    
    }
    
    // method to add name to one warrior
    func warriorSelected(number : Int) -> String {
        
        var choice: String?
        var selectWarrior: String = ""
        
        print("Choix du combatant \(number) : \n"
            + " 1- Combattant Vie: , Arme: Épée, Valeur des coups: 10\n"
            + " 2- Colosse Vie: , Arme: Épée, Valeur des coups: 10\n"
            + " 3- Nain    Vie: , Arme: Épée, Valeur des coups: 10\n"
            + " 4- Mage    Vie: , Arme: Épée, Valeur des coups: 10\n"
        )
        
        print("faite votre choix :   ")
        
        choice = readLine()
        
        if let warriorChoice = choice{
            
            switch warriorChoice {
                
            case "1" : selectWarrior = warriorChoice
                
            case "2" : selectWarrior = warriorChoice
                
            case "3" : selectWarrior = warriorChoice
                
            case "4" : selectWarrior = warriorChoice
                
                
            default :print("Merci de choisir un numéro entre 1 et 4 \n\n")
                selectWarrior = warriorSelected(number: number)
                
                
            }
            
        }
        return selectWarrior
    }
    
    
    func warriorname () -> String{
        
        var name:String?
        var nWarrior: String = ""
        var nameIsDifferent: Bool
        
        print("Nom du Warrior :   ")
        
        // if verifier l optionnel si pas Nil cours deballage + 1234
    
        name = readLine()
        
        if let nameW = name {
            
            //If name does not have letter
            /////faire une boucle
            if nameW==""{
                
                print("Merci de saisir le Nom du Warrior \n\n")
                var nameWarrior: String
                nameWarrior = warriorname()
                nWarrior = nameWarrior
                
            }else{
                
            //Loops to check if name is alreay in warriorTeam
                ///// a refaire toute equipe nom unique func a part pour ca voir acces game et Team
                nameIsDifferent = true
                if warriorTeam.count != 0 {
                       for i in 0 ..< warriorTeam.count{
                        
                            if nameW == warriorTeam[i].name{
                                    nameIsDifferent = false
                                }
                        }
                }
            //If name is already use please try a new one
                if nameIsDifferent == false{
                    
                        print("Ce nom existe déjà Merci de saisir un nouveau Nom de Warrior \n\n")
                        var nameWarrior: String
                        nameWarrior = warriorname()
                        nWarrior = nameWarrior
                    
                }else{
                    
                        nWarrior = nameW
                    
                }
            }
            
        }
        return nWarrior
    }


}

