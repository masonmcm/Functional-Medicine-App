//
//  Supplement.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 11/27/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import Foundation

class Supplement{
    
    var supplementName: String
    var supplementLevel: Int
    lazy var levelOfTextDisplayed = chooseText()
    
    init(supplement name: String, input amount: Int){
        self.supplementName = name
        self.supplementLevel = amount
    }

   func chooseText() -> String{
        let textLevel: String
        if(supplementLevel < 20) {
            textLevel = "Low"
        }else if(supplementLevel > 50){
            textLevel = "High"
        }else{
            textLevel = "Average"
        }
        return textLevel
    }
}


