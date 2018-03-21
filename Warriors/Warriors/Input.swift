//
//  Input.swift
//  Warriors
//
//  Created by thomas bouges on 18-03-15.
//  Copyright © 2018 thomasbouges. All rights reserved.
//

import Foundation

class Input {

    /////////////////////////////////////////Methods to get player reponse and return an int ////////////////////////////
    
    static func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    static func inputString() -> String {
        guard let data = readLine() else { return "" }
        return data
    }
}
