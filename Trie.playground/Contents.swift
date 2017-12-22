//: Playground - noun: a place where people can play

import UIKit

class TrieNode: NSObject {

    var value: Character!
    var endOfWord: Bool = false
    var children: [Character:TrieNode] = [:]
    
    init(value: Character?) {
        if let val = value {
        	self.value = val
        }
    }
}

class Trie: NSObject {
    
    //empty node at root
    var root = TrieNode(value: nil)
    
    func addWord(word: String) {
        var characters = Array(word.characters)
    	addWord(root: root, word: &characters)
    }
    
    private func addWord(root: TrieNode, word: inout [Character]) {
        if !word.isEmpty {
        	let currentLetter = word.remove(at: 0)
            if let letterNode = root.children[currentLetter] {
            	//root already has a child with the letter value we're trying to insert, keep recurring down trie
                addWord(root: letterNode, word: &word)
            } else {
            	//root has no child with the letter value we're trying to insert, so insert it
                let newNode = TrieNode(value: currentLetter)
                root.children[currentLetter] = newNode
                addWord(root: newNode, word: &word)
            }
        } else {
        	//word is fully inserted into trie
            //mark final node (current root) as the end of the word
            root.endOfWord = true
        }
        return
    }
    
    func searchPrefix(prefix: String) -> [String] {
        
        var suffixArray: [String] = []
        
        if prefix.characters.count > 0 {
            var prefixChars = Array(prefix.characters)
            
            //recur down the tree until we reach the root node of our search (node representing last prefix char)
            var searchRoot = root
            while !prefixChars.isEmpty {
            	let currentChar = prefixChars.remove(at: 0)
                if let currentNode = searchRoot.children[currentChar] {
                	searchRoot = currentNode
                } else {
                    //prefix does not exist in trie
                    return suffixArray
                }
            }
            //start recursive search for suffixes
            findSuffixes(root: searchRoot, suffixBuilder: "", suffixArray: &suffixArray)
        }
        
        return suffixArray
    }
    
    private func findSuffixes(root: TrieNode, suffixBuilder: String, suffixArray: inout [String]) {
        //DFS for suffixes
        for (_, child) in root.children {
            var localSuffixBuilder = suffixBuilder
        	localSuffixBuilder.append(child.value)
            if child.endOfWord {
            	suffixArray.append(localSuffixBuilder)
            }
            findSuffixes(root: child, suffixBuilder: localSuffixBuilder, suffixArray: &suffixArray)
        }
    }
}

let trie = Trie()

trie.addWord(word: "Hello")
trie.addWord(word: "Helping")
trie.addWord(word: "Helter")
trie.addWord(word: "Zach")
trie.addWord(word: "Zebra")
trie.addWord(word: "Zelda")
trie.searchPrefix(prefix: "Ze")
