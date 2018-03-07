//
//  Team.swift
//  Warriors
//
//  Created by thomas bouges on 18-02-21.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation

class Team {
    
    let teamName: String
    //tab of objet
    var warriorTeam = [Warrior]() // tab of 3 Warriors
    
    
    init(teamName:String){
        self.teamName = teamName
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
    
    func createWarriors(){
        
        for i in 0..<3 {
            createWarrior(number: i)
            
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
                break
            
        }
        
    
    }
    
/*func createWarrior(number : Int, nameTab: [String])->String{
 
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
 
 nameWarrior = warriorname(nameTab: nameTab)
 
 switch warrior {
 case 1:
 warriorTeam.append(Fighter(name: nameWarrior))
 return nameWarrior
 case 2:
 warriorTeam.append(Wizard(name: nameWarrior))
 return nameWarrior
 case 3:
 warriorTeam.append(Colossus(name: nameWarrior))
 return nameWarrior
 case 4:
 warriorTeam.append(Dwarf(name: nameWarrior))
 return nameWarrior
 default:
 print("error")
 return "error"
 }
 
 
 }*/
    
    
    func warriorname () -> String{
        
        var nameWarrior: String
        repeat{
            print("Nom du Warrior :   ")
            nameWarrior = inputString()
        }while  nameWarrior == ""
        
        return nameWarrior
    }
    
    /*
     func warriorname (nameTab: [String]) -> String{
     
     var nameWarrior: String
     var nameIsDifferent: Bool
     
     repeat{
     print("Nom du Warrior :   ")
     nameWarrior = inputString()
     nameIsDifferent = true
     
     //Loops to check if name is alreay in warriorTeam
     for i in 0 ..< nameTab.count{
     
     if nameWarrior == nameTab[i]{
     nameIsDifferent = false
     }
     }
     }while  nameIsDifferent == false
     
     return nameWarrior
     }

 */

    //show all warrior alive from one team and return int of warrior selected
    func warriorSelection() ->Int {
        var warriorSelected: Int
        
        // Selection of Warrior from our team who is going to treat or sticke
        repeat{
            print("===============================")
            print("\(self.teamName) choise your warrior")
            
            
            for i in 0 ..< self.warriorTeam.count {
                //if to show only warrior over 0 level
                if  self.warriorTeam[i].power > 0{
                    print("\(i+1)- \(self.warriorTeam[i].name) : power level : \(self.warriorTeam[i].power)")
                    print("        weapon \(self.warriorTeam[i].warriorWeapon.nameWeapon) Weapon power \(self.warriorTeam[i].warriorWeapon.powerWeapon)\n")
                    
                }
            }
            
            
            print("===============================")
            print("your choise: ")
            warriorSelected = inputInt()
            warriorSelected -= 1
            
            
            
        }while warriorSelected != 0 && warriorSelected != 1 && warriorSelected != 2 || self.warriorTeam[warriorSelected].power <= 0
        
        
        return warriorSelected
    }
    
    // Check if power of team is == 0 and return a boolean
    func powerLevelCount() ->Bool {
        
        var powerLevelTeam = true
        
        var teamPower: Int = 0
        
        for i in 0..<self.warriorTeam.count {
            teamPower += self.warriorTeam[i].power
        }
        
        if teamPower <= 0 {
            powerLevelTeam = false
        }
        
        return powerLevelTeam
    }

    func treasure(striker : Int){
        
        let number:Int = Int(arc4random_uniform(5))
        let warrior = self.warriorTeam[striker]
        
        if number == 4 {
            if let wizard = warrior as? Wizard{
                
                wizard.warriorWeapon = Wine()
                print("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=")
                print("\(wizard.name) WINE is your new Weapon")
                print("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=")
            }else{
                warrior.warriorWeapon = Thunder()
                print("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=")
                print("\(wizard.name) THUNDER is your new Weapon")
                print("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=")
            }
   
        }
        
    }
    
}

