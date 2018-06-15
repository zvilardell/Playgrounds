//: Playground - noun: a place where people can play

import UIKit

func termFrequency(term: String, document: String) -> Float {
    var count = 0
    let documentWords = document.components(separatedBy: " ")
    for word in documentWords {
        if word == term {
            count += 1
        }
    }
    return Float(count)
}

func inverseDocumentFrequency(term: String, corpus: [String]) -> Float {
    let numDocuments = corpus.count
    var numDocumentsWithTerm = 0
    for document in corpus {
        if termFrequency(term: term, document: document) > 0 {
            numDocumentsWithTerm += 1
        }
    }
    
    return logf(Float(numDocuments / numDocumentsWithTerm))
}

func search(query: String, corpus: [String]) -> [String] {
    var documentByRelevance: [Float:String] = [:]
    let queryTerms = query.components(separatedBy: " ")
    
    for document in corpus {
        var relevance: Float = 0.0
        for term in queryTerms {
            let tf = termFrequency(term: term, document: document)
            let idf = inverseDocumentFrequency(term: term, corpus: corpus)
            relevance += (tf * idf)
        }
        relevanceByDocument[relevance] = document
    }
    
    let sortedKeys = documentByRelevance.keys.sorted()
    print(documentByRelevance.keys.sorted())
    
    
    return []
}

let term = "puppies"
let corpus = ["I like puppies and puppies are better than cats",
              "I like cats",
              "Turtles are the best, not puppies",
              "I don't like pets"]

print(inverseDocumentFrequency(term: term, corpus: corpus))


