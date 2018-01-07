//: Playground - noun: a place where people can play

import UIKit

3 * 4 / 2 + 6 - 5 // = 7

// AST representation of above equation:
//
//             +
//         /       \
//        (/)       -
//       /  \      / \
//      *    2    6   5
//     / \
//    3   4
//

class Node {
    var value: Int?
    var operation: String?
    var left: Node?
    var right: Node?
    init(value: Int? = nil, operation: String? = nil, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.operation = operation
        self.left = left
        self.right = right
    }
}

//constructing AST for equation

let twoNode = Node(value: 2)
let threeNode = Node(value: 3)
let fourNode = Node(value: 4)
let fiveNode = Node(value: 5)
let sixNode = Node(value: 6)

let multiplicationNode = Node(operation: "*", left: threeNode, right: fourNode)
let divisionNode = Node(operation: "/", left: multiplicationNode, right: twoNode)
let subtractionNode = Node(operation: "-", left: sixNode, right: fiveNode)
let rootAdditionNode = Node(operation: "+", left: divisionNode, right: subtractionNode)

//evaluate AST from root
func evaluateAST(root: Node?) -> Float {
    guard let node = root else {
        return 0
    }
    
    if let value = node.value {
        //return node's value
        return Float(value)
    } else if let operation = node.operation {
        //evaluate the operator held by node via recursion
        switch operation {
        case "+":
            return evaluateAST(root: node.left) + evaluateAST(root: node.right)
        case "-":
            return evaluateAST(root: node.left) - evaluateAST(root: node.right)
        case "*":
            return evaluateAST(root: node.left) * evaluateAST(root: node.right)
        case "/":
            return evaluateAST(root: node.left) / evaluateAST(root: node.right)
        default:
            print("Unrecognized operator: \(operation)")
            return 0
        }
    }
    //function-required default return, will not actually be hit
    return 0
}

print(evaluateAST(root: rootAdditionNode))

