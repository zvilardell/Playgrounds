func divide(number num1: Int, by num2: Int) -> Int? {
    guard num2 != 0 else {
        return nil
    }
    guard num1 != 0 else {
        return 0
    }
    
    var num1 = num1
    var num2 = num2
    var answer: Int = 0
    var isNegativeAnswer: Bool = false
    
    if num1 < 0 {
        num1 = abs(num1)
        isNegativeAnswer = !isNegativeAnswer
    }
    if num2 < 0 {
        num2 = abs(num2)
        isNegativeAnswer = !isNegativeAnswer
    }
    
    while num1 > 0 {
        num1 -= num2
        if num1 >= 0 {
            answer += 1
        }
    }
    
    if isNegativeAnswer {
        answer *= -1
    }
    
    return answer
}

divide(number: -3, by: -3)
