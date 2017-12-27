//
//  Supplement.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 11/27/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import Foundation

class Supplement{
    
    let supplementRanges: [String: Double] = ["DH": 50, "DL": 25, "AH": 200, "AL": 50, "CH": 0.6, "CL": 0.3,
                                           "KH": 3.2, "KL": 0.2, "MH": 2.2, "ML": 1.7]
    var supplementName: String
    var supplementLevel: Double
    lazy var levelOfTextDisplayed = chooseText()
    
    init(supplement name: String, input amount: Double){
        self.supplementName = name
        self.supplementLevel = amount
    }

   func chooseText() -> String{
        let textLevel: String
        let splitVitaminName = supplementName.components(separatedBy: " ")
        let tempVitaminNameInit = splitVitaminName[splitVitaminName.count - 1]
        let tempVitaminNameFinal = tempVitaminNameInit[tempVitaminNameInit.startIndex]
        var vitaminNameHigh = String(tempVitaminNameFinal)
        vitaminNameHigh = vitaminNameHigh + String("H")
        var vitaminNameLow = String(tempVitaminNameFinal)
        vitaminNameLow = vitaminNameLow + String("L")
    
        if(supplementLevel < supplementRanges[vitaminNameLow]!) {
            textLevel = "Low"
        }else if(supplementLevel > supplementRanges[vitaminNameHigh]!) {
            textLevel = "High"
        }else {
            textLevel = "Average"
        }
    
        return textLevel
    }
}


