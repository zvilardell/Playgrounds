//: Playground - noun: a place where people can play

import UIKit

class TreeNode: NSObject {
    var value: Int
    var left: TreeNode!
    var right: TreeNode!
    
    init(value: Int) {
        self.value = value
    }
}

func insertNode(treeRoot: TreeNode?, new: TreeNode) -> TreeNode {
    if let root = treeRoot {
        if new.value < root.value {
            root.left = insertNode(treeRoot: root.left, new: new)
        } else if new.value > root.value {
            root.right = insertNode(treeRoot: root.right, new: new)
        }
        
        return root
    }
    
    //treeRoot being examined is nil, return the new inserted node
    return new
}

func inorderTraversal(treeRoot: TreeNode?) {
    if let root = treeRoot {
    	inorderTraversal(treeRoot: root.left)
        print(root.value)
        inorderTraversal(treeRoot: root.right)
    }
}

func searchTree(treeRoot: TreeNode?, searchValue: Int) -> TreeNode? {
    if let root = treeRoot {
        if root.value == searchValue {
        	return root
        } else if searchValue < root.value {
        	return searchTree(treeRoot: root.left, searchValue: searchValue)
        } else if searchValue > root.value {
        	return searchTree(treeRoot: root.right, searchValue: searchValue)
        }
    }
    return treeRoot
}

func deleteNode( treeRoot: TreeNode?, deleteValue: Int) -> TreeNode? {
    if let root = treeRoot {
        if deleteValue < root.value {
        	root.left = deleteNode(treeRoot: root.left, deleteValue: deleteValue)
        } else if deleteValue > root.value {
        	root.right = deleteNode(treeRoot: root.right, deleteValue: deleteValue)
        } else {
            //root is now the node we want to delete
        	
            //handle case for one or no children
            if root.right == nil {
            	return root.left
            } else if root.left == nil {
            	return root.right
            } else {
                //handle case for two children: find inorder successor of root (min value of right subtree)
                let inorderSuccessor = minValueNode(treeRoot: root.right)
                //replace root's value with inorderSuccessor's
                root.value = inorderSuccessor.value
                //delete inorder successor in right subtree
                root.right = deleteNode(treeRoot: root.right, deleteValue: inorderSuccessor.value)
            }
        }
    }
    return treeRoot
}

func minValueNode(treeRoot: TreeNode) -> TreeNode {
    if treeRoot.left == nil {
    	return treeRoot
    }
    return minValueNode(treeRoot: treeRoot.left)
}

func boundaryTraversal(treeRoot: TreeNode?) {
    //counter clockwise
    if let root = treeRoot {
        //print left boundary top to bottom
        printLeftBoundary(treeRoot: root)
        //print leaves of left subtree, left to right
        printLeaves(treeRoot: root.left)
        //print leaves of right subtree, left to right
        printLeaves(treeRoot: root.right)
        //print right boundary (excluding root, already printed) bottom to top
        printRightBoundary(treeRoot: root.right)
    }
}

func printLeftBoundary(treeRoot: TreeNode?) {
    if let root = treeRoot, (root.left != nil || root.right != nil) {
        //print values of nodes in left boundary (top to bottom) with at least one child (no leaves)
    	print(root.value)
        root.left == nil ? printLeftBoundary(treeRoot: root.right) : printLeftBoundary(treeRoot: root.left)
    }
}

func printRightBoundary(treeRoot: TreeNode?) {
    if let root = treeRoot, (root.left != nil || root.right != nil) {
    	//print values of nodes in right boundary (bottom to top) with at least one child (no leaves)
        root.right == nil ? printRightBoundary(treeRoot: root.left) : printRightBoundary(treeRoot: root.right)
        print(root.value) //print after recursive call to ensure that values will be printed bottom to top
    }
}

func printLeaves(treeRoot: TreeNode?) {
    //BFS, find nodes with no children (leaves) and print their value
    if let root = treeRoot {
    	var nodeQueue: [TreeNode] = [root]
        while !nodeQueue.isEmpty {
        	let node = nodeQueue.remove(at: 0)
            if node.left == nil && node.right == nil {
            	//this node is a leaf, print its value
                print(node.value)
            } else {
                if let left = node.left {
                	nodeQueue.append(left)
                }
                if let right = node.right {
                	nodeQueue.append(right)
                }
            }
        }
    }
}



var root = TreeNode(value: 20)
insertNode(treeRoot: root, new: TreeNode(value: 10)).value
insertNode(treeRoot: root, new: TreeNode(value: 12)).value
insertNode(treeRoot: root, new: TreeNode(value: 30))
insertNode(treeRoot: root, new: TreeNode(value: 2))
insertNode(treeRoot: root, new: TreeNode(value: 1))
insertNode(treeRoot: root, new: TreeNode(value: 25))
insertNode(treeRoot: root, new: TreeNode(value: 21))
insertNode(treeRoot: root, new: TreeNode(value: 11))
insertNode(treeRoot: root, new: TreeNode(value: 13))


inorderTraversal(treeRoot: root)

searchTree(treeRoot: root, searchValue: 3)?.value
searchTree(treeRoot: root, searchValue: 6)?.value
searchTree(treeRoot: root, searchValue: 2)?.value
searchTree(treeRoot: root, searchValue: 1)?.value

//deleteNode(treeRoot: root, deleteValue: 20)
//deleteNode(treeRoot: root, deleteValue: 12)
//deleteNode(treeRoot: root, deleteValue: 1)
//deleteNode(treeRoot: root, deleteValue: 2)
//deleteNode(treeRoot: root, deleteValue: 30)

print("-----------------------")
boundaryTraversal(treeRoot: root)

