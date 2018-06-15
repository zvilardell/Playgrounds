//: Playground - noun: a place where people can play

import UIKit

class ToDo {
    var done: Bool = false
    var name: String
    var dueTime: Date?
    var dueUrl: String?
    init(name: String, dueTime: Date? = nil, dueUrl: String? = nil) {
        self.name = name
        self.dueTime = dueTime
        self.dueUrl = dueUrl
    }
}

var toDoList: [ToDo] = []


func addItem(name: String, dueTime: Date?, dueUrl: String?) -> ToDo {
    
    let toDo = ToDo(name: name, dueTime: dueTime, dueUrl: dueUrl)
    
    toDoList.append(toDo)
    
    return toDo
}

func markDone(toDo: ToDo) -> ToDo {
    //var toDoItem = toDo
    if !toDo.done {
        toDo.done = true
    }
    return toDo
}

func printToDoList(toDoList: [ToDo]) {
    for item in toDoList {
        print("Name: \(item.name)")
        print("Done: \(item.done)")
        print("Due: \(item.dueTime?)")
        print("URL: \(item.dueUrl?)")
        print()
    }
}

var toDo1 = addItem(name: "Get milk", dueTime: Date(timeIntervalSinceNow: 24 * 60 * 60), dueUrl: nil)
var toDo2 = addItem(name: "Get eggs", dueTime: Date(timeIntervalSinceNow: 48 * 60 * 60), dueUrl: nil)
var toDo3 = addItem(name: "Get detergent", dueTime: Date(timeIntervalSinceNow: 24 * 60 * 60), dueUrl: nil)
var toDo4 = addItem(name: "Get gas", dueTime: Date(timeIntervalSinceNow: 72 * 60 * 60), dueUrl: nil)
var toDo5 = addItem(name: "Get juice", dueTime: Date(timeIntervalSinceNow: 96 * 60 * 60), dueUrl: nil)

markDone(toDo: toDo1)
markDone(toDo: toDo5)

printToDoList(toDoList: toDoList)

