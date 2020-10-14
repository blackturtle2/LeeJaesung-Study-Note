// https://programmers.co.kr/learn/courses/30/lessons/12912

import Foundation

// a와 b 사이에 속한 모든 정수의 합을 리턴.
// 3, 5 --> 3 + 4 + 5 = 12

// 16:35
func solution(_ a:Int, _ b:Int) -> Int64 {
    let newA = a >= b ? a : b
    let newB = b <= a ? b : a

    var result = 0
    for item in newB...newA {
        result += item
    }

    return Int64(result)
}

print("RESULT: ", solution(3, 5)) // 12
print("RESULT: ", solution(3, 3)) // 3
print("RESULT: ", solution(5, 3)) // 12
// 16:43 End

func newSolution(_ a:Int, _ b:Int) -> Int64 {
    let arr = a < b ? Array.init(a...b) : Array.init(b...a)

    return Int64(arr.reduce(0,+))
}

print("RESULT: ", newSolution(3, 5)) // 12
print("RESULT: ", newSolution(3, 3)) // 3
print("RESULT: ", newSolution(5, 3)) // 12

func newnewSolution(_ a:Int, _ b:Int) -> Int64 {
    return Int64(Array(a < b ? a...b : b...a).reduce(0,+))
}

print("RESULT: ", newnewSolution(3, 5)) // 12
print("RESULT: ", newnewSolution(3, 3)) // 3
print("RESULT: ", newnewSolution(5, 3)) // 12
