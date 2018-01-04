//: Playground - noun: a place where people can play

import UIKit

print("RECURSIVE")

//returns num!
func recursiveFactorial(_ num: Int) -> Int {
    guard num > 0 else {
        //0! = 1
        return 1
    }
    return num * recursiveFactorial(num - 1)
}

print(recursiveFactorial(4))


print("-----------------------------------------------------------------------")


print("NON-RECURSIVE")

//returns num!
func factorial(_ num: Int) -> Int {
    guard num > 0 else {
        //0! = 1
        return 1
    }
    
    var product = 1
    
    for i in 1...num {
        product *= i
    }
    
    return product
}

print(factorial(5))
