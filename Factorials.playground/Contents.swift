//: Playground - noun: a place where people can play

import UIKit

print("RECURSIVE")

func recursiveFactorial(_ num: Int) -> Int {
    return factorial(num, total: num)
}

//recursive helper function
func factorial(_ num: Int, total: Int) -> Int {
    guard num > 1 else {
        return total
    }
    print("num: \(num), total: \(total)")
    return factorial(num - 1, total: total * (num - 1))
}

print(recursiveFactorial(4))


print("-----------------------------------------------------------------------")


print("NON-RECURSIVE")

//returns num!
func factorial(_ num: Int) -> Int {
    guard num > 1 else {
        return num
    }
    
    var total = num
    var currentNum = num - 1
    
    while currentNum > 1 {
        total *= currentNum
        currentNum -= 1
    }
    
    return total
}

print(factorial(5))
