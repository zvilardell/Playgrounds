//: Playground - noun: a place where people can play

import UIKit

class ListNode: NSObject {
    var value: Int?
    var next: ListNode?
    
    init(value: Int) {
    	self.value = value
    }
}

class LinkedList: NSObject {
    var head: ListNode?
    
    init(headValue: Int) {
    	self.head = ListNode(value: headValue)
    }
    
    func insert(newValue: Int) {
        if var tail = head {
            while tail.next != nil {
                tail = tail.next!
            }
        	tail.next = ListNode(value: newValue)
        }
    }
    
    func printList() {
        var tail = head
        while tail != nil {
            print(tail!.value!)
            tail = tail!.next
        }
    }
}

let list = LinkedList(headValue: 4)
list.insert(newValue: 1)
list.insert(newValue: 5)
list.insert(newValue: 3)
list.insert(newValue: 6)

//list.printList()

//-------------------------------------------------------

func printList(head: ListNode?) {
    if let node = head {
        print(node.value!)
        printList(head: node.next)
    }
}

func detectCycle(head: ListNode?) -> Bool {
    var fast: ListNode? = head
    var slow: ListNode? = head
    
    while fast != nil {
        //fast pointer moves forward 2 places in list
        fast = fast?.next?.next
        //slow pointer moves forward 1 place in list
        slow = slow?.next
        
        if slow == fast {
            //cycle detected
            return true
        }
    }
    //no cycle found
    return false
}

let one = ListNode(value: 1)
let two = ListNode(value: 2)
let three = ListNode(value: 3)
let four = ListNode(value: 4)
let five = ListNode(value: 5)
let six = ListNode(value: 6)
let seven = ListNode(value: 7)
let eight = ListNode(value: 8)
one.next = two
two.next = three
three.next = four
four.next = five
five.next = six
six.next = seven
seven.next = eight

//cycle
//eight.next = four
//five.next = three

detectCycle(head: one)

