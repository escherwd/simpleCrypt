//
//  Decrypt.swift
//  encrypter
//
//  Created by Escher WD on 2/25/18.
//  Copyright © 2018 Escher WD. All rights reserved.
//

import Foundation
import Cocoa

func numbersFromString(_ string: String) -> String {
    
    var finalStr = ""
    
    for letter in string {
        if numbersStr.contains("\(letter)") {
            finalStr.append(letter)
        } else {
            let numbers = lettersToInts["\(letter)"]
            if numbers != nil {
                let paddedNum = addZeros(String(numbers!), maxDigits: 2)
                print("added \(paddedNum) from letter \(letter)")
                finalStr.append(paddedNum)
            }
        }
    }
    
    print(finalStr)
    return finalStr
    
}

func Decrypt(text:String,code:String) -> String? {
    
    if text.count > 2 {
    
        let codeNumber = numberFromString(code)
        print(codeNumber)
    
        let DigitsDigitsLength = Int(NSString(string: text).substring(with: NSRange(location: 0, length: 2)))
        let TextMinusDigitsDigits = String(text[text.index(text.startIndex, offsetBy: 2)...])
        let masterWordLength = Int(NSString(string: TextMinusDigitsDigits).substring(with: NSRange(location: 0, length:     DigitsDigitsLength!)))
        let WordsText = String(TextMinusDigitsDigits[TextMinusDigitsDigits.index(TextMinusDigitsDigits.startIndex, offsetBy:    DigitsDigitsLength!)...])
        let wordsArray = WordsText.splitByLength(masterWordLength!)
        
        
        var finalStr = ""
        
        
        for letter in wordsArray {
            if codeNumber > 0 {
                let decodedLetter = (Int(letter))!/(codeNumber)
                if let uniScalar = UnicodeScalar(decodedLetter) {
                    let character = Character(uniScalar)
                    finalStr.append(character)
                }
            }
        }
        return finalStr
    
    } else {
        return nil
    }
}
