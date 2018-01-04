//: Playground - noun: a place where people can play

import UIKit

//given a sentence of words, find all palindromes and keep count of how many times each occur in
//the sentence

let sentence = "kayak anna racecar zach kayak mom palindrome dad falcon kayak hannah bob anna dog"

//return a dictionary containing count of each palindrome found in a given sentence
func countPalindromes(in sentence: String) -> [String:Int] {
    var palindromeCountByWord: [String:Int] = [:]
    
    let slicedWords = sentence.components(separatedBy: " ")
    
    //find and count palindromes
    for word in slicedWords {
        if word == String(word.reversed()) {
            //palindrome found
            if let count = palindromeCountByWord[word] {
                //palindrome has been added to dictionary (previously found) increment count
                palindromeCountByWord[word] = count + 1
            } else {
                //first instance of palindrome found
                palindromeCountByWord[word] = 1
            }
        }
    }
    
    return palindromeCountByWord
}

print(countPalindromes(in: sentence))

//-----------------------------------------------------------------------------

//return the most common palindrome in a given sentence
func mostCommonPalindrome(in sentence: String) -> String? {
    let palindromeCountByWord = countPalindromes(in: sentence)
    
    var mostCommonPalindrome: String? = nil
    var maxCount = 0
    
    for (palindrome, count) in palindromeCountByWord {
        if count > maxCount {
            //new candidate found
            mostCommonPalindrome = palindrome
            maxCount = count
        }
    }
    
    return mostCommonPalindrome
}

print("Most common palindrome: \(mostCommonPalindrome(in: sentence) ?? "n/a")")
