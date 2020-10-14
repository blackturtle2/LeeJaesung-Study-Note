// https://programmers.co.kr/learn/courses/30/lessons/12919

import UIKit

func solution(_ seoul: [String]) -> String {
    var i = 0
    for item in seoul {
        if item == "Kim" { break }
        i += 1
    }
    return "김서방은 \(i)에 있다"
}

print("RESULT: ", solution(["Jane", "Kim"])) // "김서방은 1에 있다"

func newSolution(_ seoul: [String]) -> String {
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}

print("RESULT: ", newSolution(["Jane", "Kim"])) // "김서방은 1에 있다"
