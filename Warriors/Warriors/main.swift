//
//  main.swift
//  Warriors
//
//  Created by thomas bouges on 18-02-21.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation

var marcel = Team(teamName: "Marcel", warrior1: Combattant(name: "robert"), warrior2: Mage(name: "Leila"), warrior3: Nain(name: "hector"))


marcel.ShowTeam()

var ben = Team(teamName: "Sophia", warrior1: Colosse(name: "Brigitte"), warrior2: Mage(name: "Perrin"), warrior3: Nain(name: "Rick"))

ben.ShowTeam()

marcel.warriorTeam[0].strike(weapon: marcel.warriorTeam[0].warriorWeapon, warrior: ben.warriorTeam[1])


ben.warriorTeam[1].treatWarrior(weapon: ben.warriorTeam[1].warriorWeapon, warrior: ben.warriorTeam[1])


