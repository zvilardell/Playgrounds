//: Playground - noun: a place where people can play

import UIKit

//singly-linked list node
class Node {
    let value: Int
    var next: Node?
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

//linked list
// 1->2->3->nil

let threeNode = Node(value: 3, next: nil)
let twoNode = Node(value: 2, next: threeNode)
let oneNode = Node(value: 1, next: twoNode)

//recursively print out linked list values
func printList(headNode: Node?) {
    guard let currentNode = headNode else {
        return
    }
    print(currentNode.value)
    printList(headNode: currentNode.next)
}

print("Original order:")
printList(headNode: oneNode)

//recursively print reverse order of linked list values
func printReverseList(headNode: Node?) {
    guard let currentNode = headNode else {
        return
    }
    printReverseList(headNode: currentNode.next)
    print(currentNode.value)
}

print("Revere order 1 (original list printed tail to head):")
printReverseList(headNode: oneNode)

//reverse the order of linked list (reverse direction of each 'next' pointer in list)
func reverseLinkedList(headNode: Node?) -> Node? {
    guard let node = headNode else {
        return nil
    }
    
    var currNode: Node? = node
    var prevNode: Node?
    var nextNode: Node?
    
    while currNode != nil {
        nextNode = currNode?.next
        currNode?.next = prevNode
        prevNode = currNode
        currNode = nextNode
    }
    
    return prevNode
}

//reversed list (head will be 3 once original list is reversed)
// nil<-1<-2<-3
let reversedListHead = reverseLinkedList(headNode: oneNode)

print("Reverse order 2 (reversed list printed head to tail):")
printList(headNode: reversedListHead)





