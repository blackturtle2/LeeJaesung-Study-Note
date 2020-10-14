// https://programmers.co.kr/learn/courses/30/lessons/12918
// 문자열 다루기 기본
/*
 문자열 s의 길이가 4 혹은 6.
 숫자로만 구성되어 있는지 확인하는 함수 구현.
 s는 길이 1 이상, 8 이하인 문자열.
 */

import Foundation

func solution(_ s: String) -> Bool {
    if s.count != 4 && s.count != 6 { return false }

    var result = true
    for i in s {
        if Int("\(i)") == nil { result = false; break }
    }

    return result
}

print("RESULT: ", solution("a234")) // false
print("RESULT: ", solution("1234")) // true
print("RESULT: ", solution("12345")) // false
