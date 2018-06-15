//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func lookAndSay(root: String, times: Int) -> String {
    guard times > 0 else {
        return root
    }
    
    var processedString: String = root
    for _ in 1...times {
        //transform string into 2D array of grouped consecutive identical digits
        var tempString: String = ""
        var characterArrays: [[Character]] = []
        for character in processedString {
            if characterArrays.isEmpty {
                //empty collection, append first digit of string as new subarray
                characterArrays.append([character])
            } else if let lastProcessedCharacter = characterArrays.last?.first, lastProcessedCharacter != character {
                //non-identical digit found, append to collection as new subarray
                characterArrays.append([character])
            } else {
                //identical digit found, append to current subarray
                characterArrays[characterArrays.count - 1].append(character)
            }
        }
        //build final processed string (for this iteration) from 2D array
        for array in characterArrays {
            tempString += "\(array.count)\(array[0])"
        }
        processedString = tempString
    }
    
    return processedString
}

//111221
print(lookAndSay(root: "1", times: 4))



