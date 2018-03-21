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
    var warriorTeam = [Warrior]() // tab of 3 Warriors
    
     init(teamName:String){
        self.teamName = teamName
    }
    /////////////////////////////////////////Methods to create Team with name ///////////////////////////////////////////
   static func createTeam() ->Team {
            print("Player  please enter your Team name \n\n")
            // create name and verify if do not already exist
            let newTeam = Team(teamName: NameService.shared.uniqueTeamName())
            newTeam.createWarriors()
            return newTeam
   }
    
    /////////////////////////////////////////Create Warriors///////////////////////////////////////////
    
    //Methods to create 3 new warriors
    func createWarriors(){
        for i in 0..<3 {
            createWarrior(number: i)
        }
    }
    
    // method to create one new warrior
    func createWarrior(number : Int){
        var warrior: Int
        
        repeat{
            print("")
            print("===================================================")
            print("Please Choice your warrior \(number + 1)")
            print("1 - Figher   power: 100  Weapon: Sword  strike: -10")
            print("2 - Wizard   power:  70  Weapon: Treat   Treat: +30")
            print("3 - Colossus power: 100  Weapon: Axe    strike: -60")
            print("4 - Dwarf    power:  80  Weapon: Hammer strike: -80")
            print("===================================================")
            print("Please enter your choice :")
            
            warrior = Input.inputInt()
        }while warrior != 1 && warrior != 2 && warrior != 3 && warrior != 4
            
        switch warrior {
            case 1:
                warriorTeam.append(Fighter(name: NameService.shared.warriorName()))
            
            case 2:
                warriorTeam.append(Wizard(name: NameService.shared.warriorName()))
            
            case 3:
                warriorTeam.append(Colossus(name: NameService.shared.warriorName()))
            
            case 4:
                warriorTeam.append(Dwarf(name: NameService.shared.warriorName()))
            
            default:
                break
        }
    }
 

    //show all warrior alive from one team and return int of warrior selected
    func warriorSelection() ->Int {
        var warriorSelected: Int
        
        print("\n<><><><><><><><><><><><><><><><><>")
        print("       \(teamName)")
        // Selection of Warrior from our team who is going to treat or stricke
        repeat{
            print("<><><><><><><><><><><><><><><><><>")
            print("SELECT A WARRIOR:")

            for i in 0..<warriorTeam.count {
                //if to show only warrior over 0 level
                if  warriorTeam[i].power > 0{
                    print("\(i+1)- \(warriorTeam[i].name) : power level : \(warriorTeam[i].power)")
                    print("        weapon \(warriorTeam[i].warriorWeapon.nameWeapon) Weapon power \(warriorTeam[i].warriorWeapon.powerWeapon)")
                }
            }

            print("<><><><><><><><><><><><><><><><><>")
            print("your choise: ")
            warriorSelected = Input.inputInt()
            warriorSelected -= 1
        }while warriorSelected != 0 && warriorSelected != 1 && warriorSelected != 2 || warriorTeam[warriorSelected].power <= 0 // in case warrior number (012) selected is already died
        return warriorSelected
    }
    
    /////////////////////////////////////////Power Level Warriors check///////////////////////////////////////////
    // Check if power of team is == 0 and return a boolean
    func powerLevelCount() ->Bool {
        var powerLevelTeam = true
        var teamPower: Int = 0
        
        for i in 0..<warriorTeam.count {
            teamPower += warriorTeam[i].power
        }
        
        if teamPower <= 0 {
            powerLevelTeam = false
        }
        return powerLevelTeam
    }

    /////////////////////////////////////////Methods Show ///////////////////////////////////////////
    //Methods to show result of stricke on warrior or treatment
    func showPowerLevelWarrior(defender: Warrior) -> Void{
        if defender.power <= 0 {// if power Level is under 0 change to 0
                defender.power = 0
                print("\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++")
                print("XXXXXX  warrior \(defender.name) IS DIED  XXXXXX")
                print("++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n")
                
        }else{
                print("\n\n-----------------------------------------------------------------------")
                print("XXXXXX  warrior \(defender.name) have been attacked power level is now: \(defender.power)  XXXXXX")
                print("-----------------------------------------------------------------------\n\n")
        }
        
    }
    
}

