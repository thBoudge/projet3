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
        var warriorAlive: Int //properties to count warrior still alive
        
        
        // Selection of Warrior from our team who is going to treat or sticke
        repeat{
            print("===============================")
            print("\(teams[team1].teamName) choise your warrior")
            
            warriorAlive = 0
            for i in 0 ..< teams[team1].warriorTeam.count {
                //if to show only warrior over 0 level
                if  teams[team1].warriorTeam[i].power > 0{
                    print("\(i)- \(teams[team1].warriorTeam[i].name) : weapon \(teams[team1].warriorTeam[i].warriorWeapon.nameWeapon) Weapon power \(teams[team1].warriorTeam[i].warriorWeapon.powerWeapon)")
                    warriorAlive += 1
                }
            }
            
            
            print("===============================")
            print("your choise: ")
            striker = inputInt()
            
            
        }while striker != 1 && striker != 2 && striker != 3 //|| teams[team1].warriorTeam[striker].power <= 0
        
        // Selection of Warrior from the other team who is going to be sticke or from our team who is going to be treat
        repeat{
            print("===============================")
            
            if teams[team1].warriorTeam[striker].warriorWeapon.nameWeapon == "treat" {
                
                print("Choice one of your warrior team mate: \n")
                for i in 0 ..< teams[team1].warriorTeam.count{
                    //if to show only warrior over 0 level
                    if  teams[team1].warriorTeam[i].power > 0{
                        print("\(i)- \(teams[team1].warriorTeam[i].name) : Power Level: \(teams[team1].warriorTeam[i].power) ")
                    }
                    
                }
                
            }else{
                    
                print("Choise your Opponent:")
                for i in 0 ..< teams[1].warriorTeam.count {
                    //if to show only warrior over 0 level
                    if  teams[1].warriorTeam[i].power > 0{
                        print("\(i)- \(teams[team2].warriorTeam[i].name) : Power Level: \(teams[team2].warriorTeam[i].power)  ")
                    }
                        
                }
                
            
            }
            print("===============================")
            print("your choise: ")
            defender = inputInt()
            
            // if power Level is under 0 change to 0
            if teams[team2].warriorTeam[defender].power < 0 {
                teams[team2].warriorTeam[defender].power = 0
            }
            
        }while defender != 1 && defender != 2 && defender != 3 //|| teams[team1].warriorTeam[defender].power <= 0
            
         attacNumber += 1
        
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
    

