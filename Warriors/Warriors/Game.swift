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
    var team1: Int = 1 //properties to evaluate power of Team1
    var team2: Int = 1 //properties to evaluate power of Team2
    
    
    func play(){
        
        //Create team1
        createTeam()
        //Create team2
        createTeam()
        
        //show team number
        teams[0].showTeam()
        teams[1].showTeam()
        
        fight()
     
    }
    
    /////////////////////////////////////////Methods to create Team with name ///////////////////////////////////////////
    func createTeam(){
    
   print("Bienvenue, Nous allons commencer la création de votre équipe \n\n")
        
        var teamN:String
        teamN = createNameTeam()
    
    let newTeam = Team(teamName: teamN)
    
    newTeam.createWarrior(number: 1)
    
    newTeam.createWarrior(number: 2)
    
    newTeam.createWarrior(number: 3)
    teams.append(newTeam)
    
    
    }
    
    // Methods that give a name to Team
    func createNameTeam() -> String {
        
        print("Nom de votre équipe :  ")
        var name: String?
            name = readLine()
        
        //?? Pourquoi accepte t il le ""
        if let nameTeam = name{
            
            if nameTeam==""{
                print("Merci de saisir le Nom de votre équipe  \n\n")
                var nameTeam: String
                nameTeam = createNameTeam()
                return nameTeam
                }else{
                return nameTeam
                }
            
        }else{
            print("Merci de saisir le Nom de votre équipe  \n\n")
            var nameTeam: String
            nameTeam = createNameTeam()
            return nameTeam
            
        }
    }
    
    /////////////////////////////////////////Methods to start fight ///////////////////////////////////////////
    
    func fight() {
       
        while team1>0 && team2>0 {
            
            // Team1 play when Bollean of attacNumber =0
            if (attacNumber % 2 == 0){
                attacTreat(team1: 0, team2: 1)
                }

            // Team2 play when Bollean of attacNumber !=0
            if (attacNumber % 2 != 0){
                attacTreat(team1: 1, team2: 0)
            }
        }
            powerlevel()
            if team1 == 0 {
                
                print(" Team \(teams[1].teamName) destroyed Team \(teams[0].teamName) ")
                
            }else{
                
                print(" Team \(teams[0].teamName) destroyed Team \(teams[1].teamName) ")
                
            }
        
    }
    
        
     // Method to calculate total power of Team1 & Team 2
    func powerlevel(){
        //team 1 Warriors
        
        var team1Warrior1 = teams[0].warriorTeam[0].power
        var team1Warrior2 = teams[0].warriorTeam[1].power
        var team1Warrior3 = teams[0].warriorTeam[2].power
        // team2 warriors
        var team2Warrior1 = teams[1].warriorTeam[0].power
        var team2Warrior2 = teams[1].warriorTeam[1].power
        var team2Warrior3 = teams[1].warriorTeam[2].power
        
        //egualise to zero warrior power in order to have no negative value
        
        if team1Warrior1 < 0 {teams[0].warriorTeam[0].power = 0
            team1Warrior1 = 0
        }
        if team1Warrior2 < 0 {teams[0].warriorTeam[1].power = 0
            team1Warrior2 = 0}
        if team1Warrior3 < 0 {teams[0].warriorTeam[2].power = 0
            team1Warrior3 = 0}
        if team2Warrior1 < 0 {teams[1].warriorTeam[0].power = 0
            team2Warrior1 = 0}
        if team2Warrior2 < 0 {teams[1].warriorTeam[1].power = 0
            team2Warrior2 = 0}
        if team2Warrior3 < 0 {teams[1].warriorTeam[2].power = 0
            team2Warrior3 = 0}
        
        team1 = team1Warrior1 + team1Warrior2 + team1Warrior3
        team2 = team2Warrior1 +  team2Warrior2 + team2Warrior3
        
    }
    
    //Methods to select warrior of our team and Warrior to attac or treat
    func attacTreat (team1 : Int, team2 : Int){
        
        var team1Warrior: String?
        var team2Warrior: String?
        var teamWarriorTreat: String?
        var striker: Int
        var defender: Int
        
        
        
        print("\(teams[team1].teamName) choisi ton guerrier")
        
        for i in 0 ..< teams[team1].warriorTeam.count {
                //if to show only warrior over 0 level
                if  teams[team1].warriorTeam[i].power > 0{
                    print("\(i)- \(teams[team1].warriorTeam[i].name) : weapon \(teams[team1].warriorTeam[i].warriorWeapon.nameWeapon)  \(teams[team1].warriorTeam[i].warriorWeapon.powerWeapon)")
                }
        }
        
        print("ton choix: ")
        
        team1Warrior = readLine()
        
        
        if let t1W = team1Warrior {
            striker = Int(t1W)!
            
            if teams[team1].warriorTeam[striker].warriorWeapon.nameWeapon == "Soins" {
                
                print("Choisi le Warrior a soigner\n")
                for i in 0 ..< teams[team1].warriorTeam.count{
                    //if to show only warrior over 0 level
                    if  teams[team1].warriorTeam[i].power > 0{
                        print("\(i)- \(teams[team1].warriorTeam[i].name) : weapon \(teams[team1].warriorTeam[i].warriorWeapon.nameWeapon)  \(teams[team1].warriorTeam[i].warriorWeapon.powerWeapon)\n")
                    }
                    
                }
                print("ton choix: ")
                teamWarriorTreat = readLine()
                if let treatnumber = teamWarriorTreat{
                    defender = Int(treatnumber)!
                    
                    teams[team1].warriorTeam[striker].treatWarrior(warrior: teams[team1].warriorTeam[defender])
                }
            }else{
                
                print("Choisi ta cible\n")
                for i in 0 ..< teams[1].warriorTeam.count {
                    //if to show only warrior over 0 level
                    if  teams[1].warriorTeam[i].power > 0{
                        print("\(i)- \(teams[team2].warriorTeam[i].name) : weapon \(teams[team2].warriorTeam[i].warriorWeapon.nameWeapon)  \(teams[team2].warriorTeam[i].warriorWeapon.powerWeapon)\n")
                    }
                    
                }
                print("ton choix: ")
                team2Warrior = readLine()
                
                if let t2W = team2Warrior {
                    defender = Int(t2W)!

                    teams[team1].warriorTeam[striker].strike(warrior: teams[team2].warriorTeam[defender])
                    
                }
            }
            
            attacNumber += 1
            
            powerlevel()
            
            // show result
            teams[0].showTeam()
            teams[1].showTeam()
            
            }
        
        
        }
    
        
    }
    

