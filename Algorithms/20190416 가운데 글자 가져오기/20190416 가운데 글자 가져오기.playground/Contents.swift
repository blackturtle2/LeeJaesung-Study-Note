// https://programmers.co.kr/learn/courses/30/lessons/12903
// 가운데 글자 가져오기

import UIKit

func solution(_ s: String) -> String {
    let arrString = s.map { $0 }

    return arrString.count % 2 == 1 ? "\(arrString[(arrString.count - 1) / 2])" : "\(arrString[(arrString.count - 1) / 2])\(arrString[(arrString.count - 1) / 2 + 1])"
}

print("RESULT 1: ", solution("abcde")) // "c"
print("RESULT 2: ", solution("qwer")) // "we"


func newSolution(_ s: String) -> String {
    return Array(s).count % 2 == 0 ? "\(Array(s)[(s.count-1)/2])\(Array(s)[(s.count-1)/2 + 1])" : "\(Array(s)[(s.count-1)/2])"
}

print("RESULT 1: ", newSolution("abcde")) // "c"
print("RESULT 2: ", newSolution("qwer")) // "we"
