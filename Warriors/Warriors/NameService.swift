//
//  NameService.swift
//  Warriors
//
//  Created by thomas bouges on 18-03-16.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation

class NameService{
    
    var teamNames = [String]()
    var warriorNames = [String]()
    
    //Pattern Singleton static let et private init
    static let shared = NameService()
    private init(){}
    
    // Method tto check if there is not an egual team name
    func uniqueTeamName() -> String {
        
        var teamName = ""
        repeat {
            print("Name of Your Team :  ")
            teamName = Input.inputString()
            if teamNames.contains(teamName){
                
                print("No value or this team name already exist")
                teamName = ""
            }
            teamNames.append(teamName)
            
        }while teamName == ""
        return teamName
    }
    
    func warriorName () -> String{
        var nameWarrior = ""
        
        repeat{
            print("Nom du Warrior :   ")
            nameWarrior = Input.inputString()
            if warriorNames.contains(nameWarrior){
                
                print("No value or this warrior name already exist")
                nameWarrior = ""
            }
            warriorNames.append(nameWarrior)
        }while  nameWarrior == ""
        return nameWarrior
    }
    
    
    
}



