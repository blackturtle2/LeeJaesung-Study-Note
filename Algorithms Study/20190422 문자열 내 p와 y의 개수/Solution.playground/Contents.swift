// https://programmers.co.kr/learn/courses/30/lessons/12916
// 대문자 소문자 섞여 있는 문자열 s
// s에 p의 개수와 y의 개수를 비교해서 같으면, true / 다르면, false
// p, y 둘다 하나도 없으면, 항상 true.
// 개수를 비교할 때, 대문자 소문자를 구분하지는 않습니다.

import Foundation

func solution(_ s:String) -> Bool {
    return Array(s).filter { $0 == "p" || $0 == "P" }.count == Array(s).filter { $0 == "y" || $0 == "Y" }.count
}

print("RESULT: ", solution("pPoooyY")) // true
print("RESULT: ", solution("Pyy")) // false

func newsolution(_ s:String) -> Bool {
    let arr = Array(s.lowercased())
    return arr.filter { $0 == "p" }.count == arr.filter { $0 == "y" }.count
}

print("RESULT: ", newsolution("pPoooyY")) // true
print("RESULT: ", newsolution("Pyy")) // false
