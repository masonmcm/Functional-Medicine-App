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

//    init (
//        let myStringToNum = Int(myString)
//    //figure out which range the input is in
//    if(myStringToNum! < 20) {
//    //make Text fields visible based off range number is in
//    TVLow.isHidden = false
//    }
//    else if(myStringToNum! > 50) {
//    TVHigh.isHidden = false
//    }
//    else {
//    TVAverage.isHidden = false
//    }
//
//}
//class High: Level{
//
//}
//
//class Low: Level{
//
//}
//
//class Avg: Level{
//
//}
//
