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
    
    var teamN: String
    print("Bienvenue, Nous allons commencer la création de votre équipe \n\n")
    
    print("Nom de votre équipe :  ")
    // if verifier l optionnel si pas Nil cours deballage
    
    teamN = readLine()!
    
    let newTeam = Team(teamName: teamN)
    
    newTeam.createWarrior()
    newTeam.createWarrior()
    newTeam.createWarrior()
    teams.append(newTeam)
    
    
    }
    
        
    }
    

