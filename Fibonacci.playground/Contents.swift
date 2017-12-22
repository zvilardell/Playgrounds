//: Playground - noun: a place where people can play

import UIKit

//iterative fibonacci sequence generator up to passed-in count
func iterativeFib(count: Int) {
    //must pass in positive count
    guard count > 0 else {
        return
    }
    var prevNum = 0
    var currentNum = 1
    for _ in 1...count {
        print(currentNum)
        let temp = currentNum
        currentNum = prevNum + currentNum
        prevNum = temp
    }
}

//memoized recursive fibonacci number calculation
func recursiveFib(count: Int, fibNum: inout [Int:Int]) -> Int {
    //must pass in positive count
    guard count > 0 else {
        return 0
    }
    if count <= 2 {
        fibNum[count] = 1
        return fibNum[count] ?? 0
    }
    fibNum[count] = (fibNum[count - 2] ?? recursiveFib(count: count - 2, fibNum: &fibNum)) + (fibNum[count - 1] ?? recursiveFib(count: count - 1, fibNum: &fibNum))
    return fibNum[count] ?? 0
}

//print fibonacci sequence up to 'count' using iterative function
//iterativeFib(count: 8)

//print fibonacci sequence up to 'count' using recursive function with memo dictionary
var fibNum: [Int:Int] = [:]
recursiveFib(count: 8, fibNum: &fibNum)
for i in fibNum.keys.sorted()/*1...fibNum.count*/ {
    print(fibNum[i] ?? 0)
}




