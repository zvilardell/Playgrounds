//: Playground - noun: a place where people can play

import UIKit

var callbackDates: [Date] = []
var callbacksByDate: [Date:()->()] = [:]

func setTimeout(delay: Double, callback: @escaping ()->()) {
    let dateToFire = Date(timeIntervalSinceNow: delay)
    callbackDates.append(dateToFire)
    
    //sort callbackDates
    callbackDates.sort()
    
    
    callbacksByDate[dateToFire] = callback
    print(callbacksByDate)
}


//runs on separate thread
func checkTimeouts(callbackDates: inout [Date], callbacksByDate: inout [Date:()->()] ) {
    print("Checking timeouts")
    while true {
        print(Date())
        for (index, date) in callbackDates.enumerated() {
            if date < Date(), let callback = callbacksByDate[Date()] {
                callbackDates.remove(at: index)
                DispatchQueue.main.async {
                    callback()
                }
            } else {
                break
            }
        }
    }
}


DispatchQueue.global().async {
    checkTimeouts(callbackDates: &callbackDates, callbacksByDate: &callbacksByDate)
}


setTimeout(delay: 5) {
    print("Hello!")
}


