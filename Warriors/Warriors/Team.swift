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
    
    /////////////////////////////////////////Methods to get player reponse and return an int ////////////////////////////
    
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    func inputString() -> String {
        guard let data = readLine() else { return "0" }
        return data
    }
    
    //////////////////////////////////
    
    //Method to show each team warrior and weapon
    func showTeam() -> Void{
        
        print("\(self.teamName)")
        for i in 0...2{
            print( "\n \(self.warriorTeam[i].name)   \(self.warriorTeam[i].power) \(self.warriorTeam[i].warriorWeapon.nameWeapon) \(self.warriorTeam[i].warriorWeapon.powerWeapon)\n")
        }
    }
    
    // method to create one new warrior
    func createWarrior(number : Int){
        
        var warrior: Int
        
        var nameWarrior: String
        
        repeat{
        print("")
        print("===============================")
        print("Please Choice your warrior \(number + 1)")
        print("1 - Figher power: Weapon: strike:")
        print("2 - Wizard power: Weapon: strike:")
        print("3 - Colossus power: Weapon: strike:")
        print("4 - Dwarf power: Weapon: strike:")
        print("===============================")
        print("Please enter your choice :")
            
        warrior = inputInt()
        
    }while warrior != 1 && warrior != 2 && warrior != 3 && warrior != 4
        
        nameWarrior = warriorname()
        
        
        switch warrior {
        case 1:
            warriorTeam.append(Fighter(name: nameWarrior))
        case 2:
            warriorTeam.append(Wizard(name: nameWarrior))
        case 3:
            warriorTeam.append(Colossus(name: nameWarrior))
        case 4:
            warriorTeam.append(Dwarf(name: nameWarrior))
        default:
            print("saisir un chiffre entre 1 et 4")
        }
        
    
    }
    
    
    func warriorname () -> String{
        
        var nameWarrior: String = ""
        //var nameIsDifferent: Bool = true
        
        repeat{
            print("Nom du Warrior :   ")
            nameWarrior = inputString()
            
            /*//Loops to check if name is alreay in warriorTeam
            if warriorTeam.count != 0 {
                for i in 0 ..< warriorTeam.count{
                    
                    if nameWarrior == warriorTeam[i].name{
                        nameIsDifferent = false
                    }
                    
                }
            }*/
            
            
        }while nameWarrior == "" //|| nameIsDifferent == false
        
        return nameWarrior
        
     
    }


}

