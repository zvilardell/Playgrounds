//: Playground - noun: a place where people can play

import UIKit

//given a sentence of words, find all palindromes and keep count of how many times each occur in
//the sentence

let sentence = "kayak anna racecar zach kayak mom palindrome dad falcon kayak hannah bob anna dog"

func countPalindromes(sentence: String) -> [String:Int] {
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

print(countPalindromes(sentence: sentence))
