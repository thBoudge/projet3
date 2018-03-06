//
//  Game.swift
//  Warriors
//
//  Created by thomas bouges on 18-02-21.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation


class Game {
    
    var attacNumber: Int = 0
    var teams = [Team]()
   
    
    
    func play(){
        
        // Game welcome start message
        
            print("")
            print("===============================")
            print()
            print("Bienvenue dans le Jeu Warriors")
            print()
            print("===============================")
        
        
        //Create 2 teams for each player
        
        createTeams()
       
        //show team number
        teams[0].showTeam()
        teams[1].showTeam()
        
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
        
        var player: Int = 0
        var teamN:String
        
        repeat{
            player+=1 // Question pourquoi ++ ne fonctionne pas\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                
            print("Player \(player) please enter your Team name \n\n")
            
            teamN = createNameTeam()
            
            let newTeam = Team(teamName: teamN)
            
            var warriorNumber: Int = 0
            
            
            // Selection of 3 Warriors for each team
            repeat{
                newTeam.createWarrior(number: warriorNumber)
                warriorNumber+=1

            }while warriorNumber < 3
            
            teams.append(newTeam)
            
        }while player < 2

    }
    
    // Methods that give a name to Team
    func createNameTeam() -> String {
        
        var nameTeam: String = ""
        
        repeat{
            
            print("Name of Your Team :  ")
            
            nameTeam = inputString()
            
        }while nameTeam == ""
        
        return nameTeam
        
       /*print("Nom de votre équipe :  ")
        var name: String?
            name = readLine()
        
        //?? Pourquoi accepte t il le ""
        if let nameTeam = name{
            
            ////////utiliser une boucle while tant que different de ""
            if nameTeam==""{
                print("Merci de saisir le Nom de votre équipe  \n\n")
                var nameTeam: String
                nameTeam = createNameTeam()
                return nameTeam
                }else{
                return nameTeam
                }
            
        }else{
            ////// arevoir doublon juste retour
            print("Merci de saisir le Nom de votre équipe  \n\n")
            var nameTeam: String
            nameTeam = createNameTeam()
            return nameTeam
            
        }*/
 
    }
    
    /////////////////////////////////////////Methods to start fight ///////////////////////////////////////////
    
    func fight() {
       
        repeat{
            
            // Team1 play when Bollean of attacNumber =0
            if (attacNumber % 2 == 0){
                attacTreat(team1: 0, team2: 1)
            }
            
            // Team2 play when Bollean of attacNumber !=0
            if (attacNumber % 2 != 0){
                attacTreat(team1: 1, team2: 0)
            }
            
        }while teams[0].warriorTeam[0].power + teams[0].warriorTeam[1].power + teams[0].warriorTeam[2].power > 0 && teams[1].warriorTeam[0].power + teams[1].warriorTeam[1].power + teams[1].warriorTeam[2].power > 0
        
        victoryOrNot(teamOne: 0, teamtwo: 1)
        
       
        // show result
        teams[0].showTeam()
        teams[1].showTeam()
        

            
        }
        
 //Methods to select warrior of our team and Warrior to attac or treat
    func attacTreat(team1 : Int, team2 : Int){
        
        var striker: Int
        var defender: Int
        
        var type: String // S = stricke vs T = treat
        
        
        // Selection of Warrior from our team who is going to treat or sticke
        striker = yourWarrior(team1: team1, team2: team2)
        
        
        // Selection of Warrior from the other team who is going to be sticke or from our team who is going to be treat
        repeat{
          
            print("===============================")
            
            if teams[team1].warriorTeam[striker].warriorWeapon.nameWeapon == "treat" {
                showTeamWarrior(team1: team1, team2: team2)
                type = "T"
            }else{
                showOpponent(team1: team1, team2: team2)
                type = "S"
            }
            print("===============================")
            
            print("your choise: ")
            defender = inputInt()
            defender -= 1
      
        }while defender != 0 && defender != 1 && defender != 2 //|| teams[team1].warriorTeam[defender].power <= 0
        
        //If Attack else Traitment
        if type == "S" {
            teams[team2].warriorTeam[defender].power -= teams[team1].warriorTeam[striker].warriorWeapon.powerWeapon
            
            // if power Level is under 0 change to 0
            if teams[team2].warriorTeam[defender].power < 0 {
                teams[team2].warriorTeam[defender].power = 0
            }
            
        }else{
            teams[team1].warriorTeam[defender].power += teams[team1].warriorTeam[striker].warriorWeapon.powerWeapon
        }
        
         attacNumber += 1
        
    }
    
    // show our team Warrior and return warrior number as stricker
    func yourWarrior(team1 : Int, team2 : Int) ->Int {
        var striker: Int
        
        // Selection of Warrior from our team who is going to treat or sticke
        repeat{
            print("===============================")
            print("\(teams[team1].teamName) choise your warrior")
            
            
            for i in 0 ..< teams[team1].warriorTeam.count {
                //if to show only warrior over 0 level
                if  teams[team1].warriorTeam[i].power > 0{
                    print("\(i+1)- \(teams[team1].warriorTeam[i].name) : weapon \(teams[team1].warriorTeam[i].warriorWeapon.nameWeapon) Weapon power \(teams[team1].warriorTeam[i].warriorWeapon.powerWeapon)")
                    
                }
            }
            
            
            print("===============================")
            print("your choise: ")
            striker = inputInt()
            striker -= 1
            
        }while striker != 0 && striker != 1 && striker != 2 //|| teams[team1].warriorTeam[striker].power <= 0
        
        
        return striker
    }
    
    // show our opponnent list
    func showOpponent(team1 : Int, team2 : Int) ->Void{
        
        print("Choise your Opponent:")
        for i in 0 ..< teams[1].warriorTeam.count {
            //if to show only warrior over 0 level
            if  teams[1].warriorTeam[i].power > 0{
                print("\(i + 1)- \(teams[team2].warriorTeam[i].name) : Power Level: \(teams[team2].warriorTeam[i].power)  ")
            }
            
        }
        
    }
    
    //show power level of our team warrior
    func showTeamWarrior(team1 : Int, team2 : Int) ->Void{
        
        print("\(teams[team1].teamName)  Choice one of your warrior team mate: \n")
        for i in 0 ..< teams[team1].warriorTeam.count{
            //if to show only warrior over 0 level
            if  teams[team1].warriorTeam[i].power > 0{
                print("\(i + 1)- \(teams[team1].warriorTeam[i].name) : Power Level: \(teams[team1].warriorTeam[i].power) ")
            }
            
        }
    }
    
    //Methods to confirm if game have ending and who win
    func victoryOrNot(teamOne: Int, teamtwo: Int) {
        
        if teams[0].warriorTeam[0].power + teams[0].warriorTeam[1].power + teams[0].warriorTeam[2].power == 0 {
            
            print(" Team \(teams[0].teamName) destroyed Team \(teams[1].teamName) ")
            
            
        }
        if teams[1].warriorTeam[0].power + teams[1].warriorTeam[1].power + teams[1].warriorTeam[2].power == 0 {
            
            print(" Team \(teams[1].teamName) destroyed Team \(teams[0].teamName) ")
            
        }
        
    }
    
        
    }
    

