//: Playground - noun: a place where people can play

import UIKit

//var hashSet: Set<Int> = []
//hashSet.insert(1)
//hashSet.insert(1)
//hashSet.insert(2)
//print(hashSet)

func findTargetPair(nums: [Int], targetSum: Int) -> [Int] {
    var hashSet: Set<Int> = []
    
    for num in nums {
        if hashSet.contains(targetSum - num) {
            //second half of target pair found in hashSet, return pair
        	return [num, targetSum - num]
        } else {
            //target pair member not found in hashSet for current num, add current num to hashSet for later lookup
        	hashSet.insert(num)
        }
    }
    
    return []
}

var nums = [1,4,5,8,13,6,2,8]
let targetSum = 12

findTargetPair(nums: nums, targetSum: 9)
