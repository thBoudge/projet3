//
//  Game.swift
//  Warriors
//
//  Created by thomas bouges on 18-02-21.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation


class Game {
    
    var attacNumber: Int = 0 // count attack and depend on it choice which player is going to play
    var teams = [Team]() // Table of team here 2 teams with 3 warriors with one weapon by warrior
  
    /////////////////////////////////////////Methods to start the Game ///////////////////////////////////////////
    func play(){
        print("")
        print("===============================")
        print()
        print("   Welcome to Warriors Game")
        print()
        print("===============================")
        //Create 2 teams for each player
        createTeams()
        //show both teams numbers and warriors
        showTeam(team1: 0, team2: 1)
        
        fight()
        
        // show winner of game
        victoryOrNot(teamOne: 0, teamtwo: 1)
        // show result
        print("\n Game was done on a total of \(attacNumber) attacks/treatment \n")
        showTeam(team1: 0, team2: 1)
    }
    
    /////////////////////////////////////////Methods to create Team with name ///////////////////////////////////////////
    func createTeams(){
        for _ in 0..<2 {
            teams.append(Team.createTeam())
        }
    }
    
    //Method to show each team warriors and their power Level
    func showTeam(team1:Int,team2:Int) -> Void{
        print("=======================================================")
        print("\(teams[team1].teamName)                    VS                \(teams[team2].teamName)  ")
        print("=======================================================")
        
        for i in 0...2{
            print( "\(i + 1)- \(teams[team1].warriorTeam[i].name) power level:  \(teams[team1].warriorTeam[i].power) ||| \(i + 1)- \(teams[team2].warriorTeam[i].name) power level:  \(teams[team2].warriorTeam[i].power) ")
        }
        print("=======================================================")
    }
    
    /////////////////////////////////////////Methods to start fight ///////////////////////////////////////////
    func fight() {
       var powerLevelOver0: Bool = true
       repeat{
            // Team1 play when Bollean of attacNumber =0
            if (attacNumber % 2 == 0){
                powerLevelOver0 = attacTreat(team1: 0, team2: 1) // return true or false depend if team2 power is 0
             }
            
            // Team2 play when Bollean of attacNumber !=0 and totalpower of team2 > 0
            if (attacNumber % 2 != 0) && teams[1].powerLevelCount() == true{
                powerLevelOver0 = attacTreat(team1: 1, team2: 0) // return true or false depend if all warriors of team2 are dead or not
            }
        }while powerLevelOver0 == true
    }
        
    //Methods to select warrior of our team and Warrior to attac or treat
    func attacTreat(team1 : Int, team2 : Int) -> Bool{
        
        var striker: Int
        var defender: Int
        var powerLevelOver0: Bool = true // false if all player of team 2 are died
       
        // Selection of Warrior from our team who is going to treat or sticke
        striker = teams[team1].warriorSelection()
        
        // Add or not a weapon or treatment with a treasure (1 on 5 chance to new weapon)
        treasure(warriorStriker: teams[team1].warriorTeam[striker])
        
        // Selection of Warrior from the other team who is going to be sticke or from our team who is going to be treat
        repeat{
                print("============== VS//TO =================")
                let warrior = teams[team1].warriorTeam[striker]
                //verifie si ton warrior est de type wyzard
                //other option if let wizard = warrior as? Wizard{}
                // Just check if warrior == Wizard()
                if let wizard = warrior as? Wizard{
                    defender = teams[team1].warriorSelection()
                    wizard.treatWarrior(warrior: teams[team1].warriorTeam[defender])
                    
                }else{
                    defender = teams[team2].warriorSelection()
                    warrior.strike(warrior: teams[team2].warriorTeam[defender])
                    //Show result and change power level to 0 if negative
                    teams[team1].showPowerLevelWarrior(defender: teams[team2].warriorTeam[defender], stricker: striker)
                }
        }while defender != 0 && defender != 1 && defender != 2
        attacNumber += 1
        
        // powerLevelCount return false if Allwarriors team2 are died
        if !teams[team2].powerLevelCount() {
            powerLevelOver0 = false
        }
        return powerLevelOver0
    }
   
    //Methods to confirm if game have ending and who win
    func victoryOrNot(teamOne: Int, teamtwo: Int) {
        
        for team in teams {
            
            if !team.powerLevelCount() {
                print(" Team \(team.teamName) have been destroyed")
            }else{
                print(" Team \(team.teamName) win this fight")
            }
        }
        
    }
  
    
    /////////////////////////////////////////Treasure///////////////////////////////////////////
    // Treasure open randomly : new weapon for Warriors and new treatment for Wizards
    func treasure(warriorStriker: Warrior){
        let number:Int = Int(arc4random_uniform(5))
        
        if number == 4 {
            if let wizard = warriorStriker as? Wizard{
                wizard.warriorWeapon = Wine()
                print("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=")
                print("\(wizard.name) WINE is your new Weapon ")
                print("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=")
            }else{
                warriorStriker.warriorWeapon = Thunder()
                print("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=")
                print("\(warriorStriker.name) THUNDER is your new Weapon")
                print("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=")
            }
        }
    }
    
}
    

