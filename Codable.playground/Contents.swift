//: Playground - noun: a place where people can play

import UIKit

struct Movie: Codable {
    enum Genre: String, Codable {
        case drama
        case action
        case comedy
        case western
        case scifi
        case romance
        case horror
    }
    let title: String
    let director: String
    let genre: [Genre]
}

let serenity = Movie(title: "Serenity", director: "Joss Whedon", genre: [.action, .scifi, .western])

let jsonEncoder = JSONEncoder()
let jsonDecoder = JSONDecoder()
do {
	let jsonData = try jsonEncoder.encode(serenity)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
    	print(jsonString)
    }
    let movie = try jsonDecoder.decode(Movie.self, from: jsonData)
    print(movie.title, movie.director, movie.genre)
} catch {}
