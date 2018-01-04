//: Playground - noun: a place where people can play

import UIKit

var sortedNumbers = [1,3,5,6,7,10,12,13,15,16,19,21]

func binarySearchForValue(_ searchValue: Int, in array: [Int]) -> Bool {
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        
        print("left: \(leftIndex, array[leftIndex]), right: \(rightIndex, array[rightIndex]), middle: \(middleIndex, array[middleIndex])")
        
        if middleValue == searchValue {
            //value found
            return true
        } else if searchValue < middleValue {
            //search left half of array for value
            rightIndex = middleIndex - 1
        } else if searchValue > middleValue {
            //search right half of array for value
            leftIndex = middleIndex + 1
        }
    }
    
    return false
}

print(binarySearchForValue(7, in: sortedNumbers))
