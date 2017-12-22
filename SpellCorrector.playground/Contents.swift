//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// This is the text editor interface.
// Anything you type or change here will be seen by the other person in real time.
// SpellCorrector
// validWords: ["yellow", "radish"]
// input: "YeLLoW" output: "yellow"
// input: "yfleow" output: null
// input: "yolluw" output: "yellow"
// input: "RoDIsh" output: "radish"
// "rodish", "r*d*sh"
// input: "aeeaerieaudshooooooooooo" => "nil"
// input: ""

class SpellCorrector {
    
    var validWords: [String:String] = [:]
    let vowels: [Character] = ["a","e","i","o","u","y"]
    
    init(validWords: [String]) {
        for word in validWords {
            //create dictionary with vowel replaced lowercase keys
            self.validWords[getVowelSwappedLowercaseString(input: word)] = word
        }
    }
    
    func getVowelSwappedLowercaseString(input: String) -> String {
        var tempString: String = ""
        for character in input.lowercased() {
            if vowels.contains(character) {
                tempString.append("*")
            } else {
                tempString.append(character)
            }
        }
        return tempString
    }
    
    func correctSpelling(input: String) -> String? {
        guard input != "" else {
            return nil
        }
        
        let vowelSwappedLowercaseInput = getVowelSwappedLowercaseString(input: input)
        
        if let word = validWords[vowelSwappedLowercaseInput] {
            return word
        }
        
        return nil
    }
}

let validWords: [String] = ["yeLLow", "rAdIsh", "zach", "Joe"]
let spellCorrector = SpellCorrector(validWords: validWords)


print(spellCorrector.correctSpelling(input: "RoDysh"))
