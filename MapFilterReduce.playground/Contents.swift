//: Playground - noun: a place where people can play

import UIKit

let array = [1,2,3,4,5,6]
print(array)

let filteredArrray = array.filter { $0 % 2 == 0 }
print(filteredArrray)

let mappedArray = filteredArrray.map { $0 * 2 }
print(mappedArray)

let reducedArray = mappedArray.reduce(0, +)
print(reducedArray)


