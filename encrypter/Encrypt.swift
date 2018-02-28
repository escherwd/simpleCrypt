//
//  Encrypt.swift
//  encrypter
//
//  Created by Escher WD on 2/25/18.
//  Copyright © 2018 Escher WD. All rights reserved.
//

import Foundation
import Cocoa

func Encrypt(text:String,code:String) -> String {
    let codeNumber = numberFromString(code)
    print("CODE #: \(codeNumber)")
    var uniNumbers = [Int]()
    var uniStrings = [String]()
    for letter in text {
        let letterInt:Int = Int(letter.unicodeScalarCodePoint())*codeNumber
        uniNumbers.append(letterInt)
        print("Letter w/ no padding: \(letterInt)")
    }
    let largestInt = uniNumbers.max() ?? 0
    let maxDigits = String(largestInt).count
    print(maxDigits)
    for (index,number) in uniNumbers.enumerated() {
        let numberWithZeros = addZeros(String(number), maxDigits: maxDigits)
        print("number w/ padding: \(numberWithZeros)")
        uniStrings.append(numberWithZeros)
    }
    let maxDigitsDigits:Int = String(maxDigits).count
    let maxDigitsDigitsPadded:String = addZeros(String(maxDigitsDigits), maxDigits: 2)
    print("the max digits number is \(maxDigitsDigitsPadded) digits")
    var finalStr = "\(maxDigitsDigitsPadded)\(maxDigits)"
    for number in uniStrings {
        finalStr.append(number)
    }
    return finalStr
}

func numbersToString(numbers:String) -> String {
    let stringsBefore = numbers.splitByLength(2)
    var stringsAfter = ""
    for num in stringsBefore {
        if (Int(num)! >= 0) && (Int(num)! <= 51) {
            stringsAfter.append(intsToLetters[Int(num)!]!)
            print("appended \(num) as letter")
        } else {
            stringsAfter.append(num)
            print("appended \(num)")
        }
    }
    return stringsAfter
}


