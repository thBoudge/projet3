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
        
        //Créer team1
        createTeam()
        //Créer team2
        createTeam()
        
        //Affichage info sur team
        teams[0].showTeam()
        teams[1].showTeam()
        
        
        
    }
    
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
    
        
    }
    

