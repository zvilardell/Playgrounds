//: Playground - noun: a place where people can play

import UIKit

//iterative fibonacci sequence generator up to passed-in count
func iterativeFib(count: Int) -> [Int] {
    //must pass in positive count
    guard count > 0 else {
        return []
    }
    var fibNums = [Int]()
    var prevNum = 0
    var currentNum = 1
    for _ in 1...count {
        fibNums.append(currentNum)
        let temp = currentNum
        currentNum = prevNum + currentNum
        prevNum = temp
    }
    return fibNums
}

//print fibonacci sequence up to 'count' using iterative function
print(iterativeFib(count: 8))

//--------------------------------------------------------------------------------

func recursiveFib(numSteps: Int) -> [Int] {
    var fibDict: [Int:Int] = [:]
    recursiveFib(numSteps: numSteps, memo: &fibDict)
    var fibNums = [Int]()
    for i in fibDict.keys.sorted() {
        fibNums.append(fibDict[i] ?? 0)
    }
    return fibNums
}

func recursiveFib(numSteps: Int, memo: inout [Int:Int]) -> Int {
    guard numSteps > 0 else {
        return 0
    }
    guard numSteps > 2 else {
        memo[numSteps] = 1
        return 1
    }
    
    memo[numSteps] = (memo[numSteps - 1] ?? recursiveFib(numSteps: numSteps - 1, memo: &memo)) +
                     (memo[numSteps - 2] ?? recursiveFib(numSteps: numSteps - 2, memo: &memo))
    
    return memo[numSteps] ?? 0
}

print(recursiveFib(numSteps: 8))


