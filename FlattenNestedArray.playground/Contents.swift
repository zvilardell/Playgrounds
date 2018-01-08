//: Playground - noun: a place where people can play

import UIKit

//given a nested array: [1, 2, [3, [4, 5]]]
//flatten into 1-dimensional array: [1, 2, 3, 4, 5]

func flattenArray(array: Array<Any>) -> [Any] {
    guard !array.isEmpty else {
        return []
    }
    
    //remove the current element at the front of the array
    var arr = array
    let currentElement = arr.removeFirst()
    //print("Remaining: \(arr)\nCurrent: \(currentElement)\n")
    
    if currentElement is Array<Any> {
        //found nested array, append elements to front of main array and continue flattening recursively
        return flattenArray(array: currentElement as! Array<Any> + arr)
    } else {
        //recursively retrieve the next element to add to our final flattened array
    	return [currentElement] + flattenArray(array: arr)
    }
}

print(flattenArray(array: [1, 2, [3, [4, 5]]] ))
print(flattenArray(array: ["This", ["string", ["array", "needs"], "to", ["be", "flat"]]] ))
