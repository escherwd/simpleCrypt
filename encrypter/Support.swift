//
//  Support.swift
//  encrypter
//
//  Created by Escher WD on 2/25/18.
//  Copyright © 2018 Escher WD. All rights reserved.
//

import Foundation
import Cocoa

extension Character
{
    func unicodeScalarCodePoint() -> UInt32
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}

func addZeros(_ str:String,maxDigits:Int) -> String {
    var finalStr = str
    let dif = maxDigits-str.count
    if dif > 0 {
        for padLetter in 1...dif {
            finalStr = "0"+finalStr
        }
    }
    return finalStr
}

func numberFromString(_ str:String) -> Int {
    var finalInt:Int = 0
    for letter in str {
        finalInt += Int(letter.unicodeScalarCodePoint())
    }
    return Int(finalInt) ?? 0
}


extension String {
    func splitByLength(_ length: Int) -> [String] {
        var result = [String]()
        var collectedCharacters = [Character]()
        collectedCharacters.reserveCapacity(length)
        var count = 0
        
        for character in self.characters {
            collectedCharacters.append(character)
            count += 1
            if (count == length) {
                // Reached the desired length
                count = 0
                result.append(String(collectedCharacters))
                collectedCharacters.removeAll(keepingCapacity: true)
            }
        }
        
        // Append the remainder
        if !collectedCharacters.isEmpty {
            result.append(String(collectedCharacters))
        }
        
        return result
    }
}

let numbersStr = ["0","1","2","3","4","5","6","7","8","9"]

let intsToLetters: [Int:String] = [0:"A",
                                   1:"B",
                                   2:"C",
                                   3:"D",
                                   4:"E",
                                   5:"F",
                                   6:"G",
                                   7:"H",
                                   8:"I",
                                   9:"J",
                                   10:"K",
                                   11:"L",
                                   12:"M",
                                   13:"N",
                                   14:"O",
                                   15:"P",
                                   16:"Q",
                                   17:"R",
                                   18:"S",
                                   19:"T",
                                   20:"U",
                                   21:"V",
                                   22:"W",
                                   23:"X",
                                   24:"Y",
                                   25:"Z",
                                   26:"a",
                                   27:"b",
                                   28:"c",
                                   29:"d",
                                   30:"e",
                                   31:"f",
                                   32:"g",
                                   33:"h",
                                   34:"i",
                                   35:"j",
                                   36:"k",
                                   37:"l",
                                   38:"m",
                                   39:"n",
                                   40:"o",
                                   41:"p",
                                   42:"q",
                                   43:"r",
                                   44:"s",
                                   45:"t",
                                   46:"u",
                                   47:"v",
                                   48:"w",
                                   49:"x",
                                   50:"y",
                                   51:"z",]

let lettersToInts: [String:Int] = ["A":0,
                                   "B":1,
                                   "C":2,
                                   "D":3,
                                   "E":4,
                                   "F":5,
                                   "G":6,
                                   "H":7,
                                   "I":8,
                                   "J":9,
                                   "K":10,
                                   "L":11,
                                   "M":12,
                                   "N":13,
                                   "O":14,
                                   "P":15,
                                   "Q":16,
                                   "R":17,
                                   "S":18,
                                   "T":19,
                                   "U":20,
                                   "V":21,
                                   "W":22,
                                   "X":23,
                                   "Y":24,
                                   "Z":25,
                                   "a":26,
                                   "b":27,
                                   "c":28,
                                   "d":29,
                                   "e":30,
                                   "f":31,
                                   "g":32,
                                   "h":33,
                                   "i":34,
                                   "j":35,
                                   "k":36,
                                   "l":37,
                                   "m":38,
                                   "n":39,
                                   "o":40,
                                   "p":41,
                                   "q":42,
                                   "r":43,
                                   "s":44,
                                   "t":45,
                                   "u":46,
                                   "v":47,
                                   "w":48,
                                   "x":49,
                                   "y":50,
                                   "z":51]
