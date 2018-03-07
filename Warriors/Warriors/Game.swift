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
    var teams = [Team]()
    var teamName = [String]() // To regroup all  name in order to avoid similar name and "" no value
    var warriorNames = [String]() // Tab to regroup all warrior name in order to avoid similar name and "" no value
  
    func play(){
        
        // Game welcome start message
        
            print("")
            print("===============================")
            print()
            print("Bienvenue dans le Jeu Warriors")
            print()
            print("===============================")
        
        //append "" no value in order to avoid no value on warrior names and on Team Name
        warriorNames.append("")
        teamName.append("")
        
        //Create 2 teams for each player
        createTeams()
       
        //show team number
        showTeam(team1: 0, team2: 1)
        
        fight()
     
    }
    
    /////////////////////////////////////////Methods to get player reponse and return an int ////////////////////////////
    
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    func inputString() -> String {
        guard let data = readLine() else { return "" }
        return data
    }
    
    
    /////////////////////////////////////////Methods to create Team with name ///////////////////////////////////////////
    func createTeams(){
      var teamN:String
        
        for _ in 0..<2 {
          
            print("Player  please enter your Team name \n\n")
            
            teamN = createNameTeam()
            teamName.append(teamN)// add to tab of teamName
            
            let newTeam = Team(teamName: teamN)
            newTeam.createWarriors()
            
            
            teams.append(newTeam)
            
        }

    }
    
    /*
     func createTeams(){
     
     var player: Int = 0
     var teamN:String
     
     repeat{
     player+=1 // Question pourquoi ++ ne fonctionne pas\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
     
     print("Player \(player) please enter your Team name \n\n")
     
     teamN = createNameTeam()
     teamName.append(teamN)// add to tab of teamName
     
     let newTeam = Team(teamName: teamN)
     
     var warriorNumber: Int = 0
     
     
     // Selection of 3 Warriors for each team
     repeat{
     var namW: String
     
     namW = newTeam.createWarrior(number: warriorNumber, nameTab: warriorNames)
     warriorNames.append(namW)
     warriorNumber+=1
     
     }while warriorNumber < 3
     
     teams.append(newTeam)
     
     }while player < 2
     
     }
 */
    
    // Methods that give a name to Team
    func createNameTeam() -> String {
        
        var nameTeam: String
        var nameIsDifferent: Bool
        
        repeat{
            
            print("Name of Your Team :  ")
            nameIsDifferent = true
            nameTeam = inputString()
            
            //Loops to check if name is alreay in warriorTeam
            for i in 0 ..< teamName.count{
                
                if nameTeam == teamName[i]{
                    nameIsDifferent = false
                }
            }
            
        }while nameIsDifferent == false
        
        return nameTeam
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
                attacTreat(team1: 0, team2: 1)
                // show result
                showTeam(team1: 0, team2: 1)
                
            }
            
            // Team2 play when Bollean of attacNumber !=0
            if (attacNumber % 2 != 0){
                attacTreat(team1: 1, team2: 0)
            
                // show result
                showTeam(team1: 0, team2: 1)
                
            }
            
            // powerLevelCoubt return false if warriors power level = 0
            if !teams[0].powerLevelCount() || !teams[1].powerLevelCount() {
                
                powerLevelOver0 = false
            }
            
            
        }while powerLevelOver0 == true
            
            
            //teams[0].warriorTeam[0].power + teams[0].warriorTeam[1].power + teams[0].warriorTeam[2].power != 0 && teams[1].warriorTeam[0].power + teams[1].warriorTeam[1].power + teams[1].warriorTeam[2].power != 0
        
        
        victoryOrNot(teamOne: 0, teamtwo: 1)
        
       
        // show result
        showTeam(team1: 0, team2: 1)
   
        }
        
    //Methods to select warrior of our team and Warrior to attac or treat
    func attacTreat(team1 : Int, team2 : Int){
        
        var striker: Int
        var defender: Int
       
        // Selection of Warrior from our team who is going to treat or sticke
        striker = teams[team1].warriorSelection()
        
        // ajout changement wepon avec tresor
        teams[team1].treasure(striker: striker)
        
        // Selection of Warrior from the other team who is going to be sticke or from our team who is going to be treat
        repeat{
           
                    print("===============================")
                    let warrior = teams[team1].warriorTeam[striker]
                    //verifie si ton warrior est de type wyzard
            //if let wizard = warrior as? Wizard{}
                    // Just check if warrior == wizard
                    if warrior is Wizard {
                        defender = teams[team1].warriorSelection()
                    
                        teams[team1].warriorTeam[defender].power += teams[team1].warriorTeam[striker].warriorWeapon.powerWeapon
                        
                        print("wariors \(teams[team1].warriorTeam[defender].name) have been treat power level is now: \(teams[team1].warriorTeam[defender].power)")
                        
                    }else{
                        
                        defender = teams[team2].warriorSelection()
                        
                        teams[team2].warriorTeam[defender].power -= teams[team1].warriorTeam[striker].warriorWeapon.powerWeapon
                        //Show result and change power level to ) if negative
                        
                        powerLevelWarrior(warrior: teams[team2].warriorTeam[defender])
                       
                        
                    }
                    
            }while defender != 0 && defender != 1 && defender != 2
         attacNumber += 1
        
    }
   

 
    
    //Methods to confirm if game have ending and who win
    func victoryOrNot(teamOne: Int, teamtwo: Int) {
        
        if teams[0].warriorTeam[0].power + teams[0].warriorTeam[1].power + teams[0].warriorTeam[2].power == 0 {
            
            print(" Team \(teams[1].teamName) destroyed Team \(teams[0].teamName) ")
            
            
        }
        if teams[1].warriorTeam[0].power + teams[1].warriorTeam[1].power + teams[1].warriorTeam[2].power == 0 {
            
            print(" Team \(teams[0].teamName) destroyed Team \(teams[1].teamName) ")
            
        }
        
    }
    
    /*//Methods to open treasure : new arm to attack or treat
    func treasure(team1 : Int, team2 : Int, striker: Int) -> Void {
        var powerLevelUnderO: Bool = false
        var defender:Int
        var choise: Int
        var type: String
        // Selection of Warrior from the other team who is going to be sticke or from our team who is going to be treat
        repeat{
            
            
            print("===============================")
            print("        T R E A S U R E")
            print("===============================")
            
            if teams[team1].warriorTeam[striker].warriorWeapon.nameWeapon == "treat" {
                repeat{
                        print("===============================")
                        print("Please Choice best treatment for your team ")
                        print("1 - Herbs : + 100 power level")
                        print("2 - Wine : *2 power level for wizard and for one of warrior team ")
                        print("===============================")
                        print("Please enter your choice :")
                    
                        choise = inputInt()
                } while choise != 1 && choise != 2
            
                showTeamWarrior(team1: team1, team2: team2)
                type = "T"
                
            }else{
                repeat{
                    print("===============================")
                    print("Please Choice best treatment for your team ")
                    print("1 - Thunder : stricke power 100 ")
                    print("2 - clock : Your opponent lost this turn")
                    print("===============================")
                    print("Please enter your choice :")
                    
                    choise = inputInt()
                } while choise != 1 && choise != 2
                
                showOpponent(team1: team1, team2: team2)
                type = "S"
            }
            print("===============================")
            
            print("your choise: ")
            defender = inputInt()
            defender -= 1
            
            if type == "S" {
              if teams[team2].warriorTeam[defender].power <= 0{
                    powerLevelUnderO = true
                    choise+=2
                }
                
            }else{
                if teams[team1].warriorTeam[defender].power <= 0{
                    powerLevelUnderO = true
                    
                }
            }
            
        }while defender != 0 && defender != 1 && defender != 2 || powerLevelUnderO == true
        
        
        switch choise {
        case 1:
            teams[team1].warriorTeam[defender].power += 100
            
            print("wariors \(teams[team1].warriorTeam[defender].name) have been treat power level is now: \(teams[team1].warriorTeam[defender].power)")
        case 2:
            teams[team1].warriorTeam[defender].power *= 2
            teams[team1].warriorTeam[striker].power *= 2
            
            print("wariors \(teams[team1].warriorTeam[defender].name) have been treat power level is now: \(teams[team1].warriorTeam[defender].power)")
            print("AND")
            print("wariors \(teams[team1].warriorTeam[striker].name) have been treat power level is now: \(teams[team1].warriorTeam[striker].power)")
        case 3:
             teams[team2].warriorTeam[defender].power -= 100
             powerLevelWarrior(warrior: teams[team2].warriorTeam[defender])
            
        case 4:
            teams[team2].warriorTeam[defender].power -= teams[team1].warriorTeam[striker].warriorWeapon.powerWeapon
            attacNumber += 1 // add a turn so player is going to play 2 times consequently
            powerLevelWarrior(warrior: teams[team2].warriorTeam[defender])
            
        default:
            print("Error")
        }
    }
    */
 
    //Methods to show result of stricke on warrior and to avoid power level under 0
    func powerLevelWarrior(warrior: Warrior) -> Void{
        // if power Level is under 0 change to 0
        if warrior.power <= 0 {
            warrior.power = 0
            print("wariors \(warrior.name) is died")
        }else{
            print("wariors \(warrior.name) have been attacked power level is now: \(warrior.power)")
        }
    }
        
}
    

