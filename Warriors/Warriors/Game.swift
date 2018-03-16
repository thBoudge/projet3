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
  
    /////////////////////////////////////////Methods to start the Game ///////////////////////////////////////////
    func play(){
        
        // Game welcome start message
        
            print("")
            print("===============================")
            print()
            print("   Welcome to Warriors Game")
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
    
    
    /////////////////////////////////////////Methods to create Team with name ///////////////////////////////////////////
    
    func createTeams(){
        
        
        for _ in 0..<2 {
            
            teams.append(Team.createTeam())
            
        }
        
    }
    
    
   /* func createTeams(){
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
    
    
    // Methods that give a name to Team
    func createNameTeam() -> String {
        
        var nameTeam: String
        var nameIsDifferent: Bool
        
        repeat{
            
            print("Name of Your Team :  ")
            nameIsDifferent = true
            nameTeam = Input.inputString()
            
            //Loops to check if name is alreay in warriorTeam
            for i in 0 ..< teamName.count{
                
                if nameTeam == teamName[i]{
                    nameIsDifferent = false
                }
            }
            
        }while nameIsDifferent == false
        
        return nameTeam
    }*/
    
    
    
    
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
                
                // powerLevelCount return false if Allwarriors team1 power level = 0
                if !teams[1].powerLevelCount() {
                    powerLevelOver0 = false
                }
                
            }
            
            // Team2 play when Bollean of attacNumber !=0 and totalpower of team2 > 0
            if (attacNumber % 2 != 0) && teams[1].powerLevelCount() == true{
                attacTreat(team1: 1, team2: 0)
                
                // powerLevelCount return false if Allwarriors team0 power level = 0
                if !teams[0].powerLevelCount() {
                    powerLevelOver0 = false
                }
                
            }
            
           
            
            
        }while powerLevelOver0 == true
        
        victoryOrNot(teamOne: 0, teamtwo: 1)
        // show result
        print("\n Game was done on a total of \(attacNumber) attacks/treatment \n")
        
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
                    print("============== VS//TO =================")
                    let warrior = teams[team1].warriorTeam[striker]
                    //verifie si ton warrior est de type wyzard
                    //other option if let wizard = warrior as? Wizard{}
                    // Just check if warrior == Wizard()
                    if warrior is Wizard {
                        defender = teams[team1].warriorSelection()
                        teams[team1].warriorTeam[defender].power += teams[team1].warriorTeam[striker].warriorWeapon.powerWeapon
                        
                        teams[team1].showPowerLevelWarrior(defender: teams[team1].warriorTeam[defender], stricker: striker)
                        
                        
                    }else{
                        defender = teams[team2].warriorSelection()
                        teams[team2].warriorTeam[defender].power -= teams[team1].warriorTeam[striker].warriorWeapon.powerWeapon
                        //Show result and change power level to 0 if negative
                        teams[team1].showPowerLevelWarrior(defender: teams[team2].warriorTeam[defender], stricker: striker)
                        
                    }
        }while defender != 0 && defender != 1 && defender != 2
        attacNumber += 1
    }
   

 
    
    //Methods to confirm if game have ending and who win
    func victoryOrNot(teamOne: Int, teamtwo: Int) {
        
        if !teams[0].powerLevelCount() {
            print(" Team \(teams[1].teamName) destroyed Team \(teams[0].teamName) ")
        }
        if !teams[1].powerLevelCount()  {
            print(" Team \(teams[0].teamName) destroyed Team \(teams[1].teamName) ")
        }
        
    }
  
    
     /////////////////////////////////////////name Verification ///////////////////////////////////////////
    // Methods to verify that no team have the same name
    func teamNameVerify(name: String) -> Bool {
        var new: Bool = true
        
        if name == ""{
            
                new = false
        }
        if teams.count > 0 {
                for i in 0..<teams.count {
                    var teamname:String
                    teamname = teams[i].teamName
                    if name == teamname {
                        
                        new = false
                    }
                    
                    }
        }
        
        return new
        
    }
    
    // Methods to verify that no warriors have the same name
    func warriorsNameVerify(name: String) -> Bool {
        var new: Bool = true
        
        if name == ""{
            
            new = false
        }
        if teams.count > 0 {
            
            for i in 0..<teams.count {
                
                for j in 0..<teams[i].warriorTeam.count {
                    
                    var warriorName:String
                    warriorName = teams[i].warriorTeam[j].name
                    
                    if name == warriorName{
                        
                        new = false
                    }
                }
            }
        }
        
        return new
        
    }
    
    
}
    

