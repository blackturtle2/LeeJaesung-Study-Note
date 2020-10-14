// https://programmers.co.kr/learn/courses/30/lessons/12915
// 문자열 string 배열, 정수 n.
// 각 문자열의 n번째 글자를 기준으로 오름차순 정렬.

import Foundation

func solution(_ strings: [String], _ n: Int) -> [String] {
    let s = strings.reduce(into: [String: Character]()) { $0[$1] = Array($1)[n] }
    return s.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value}.map({ $0.key })
}

print("RESULT: ", solution(["sun", "bed", "car"], 1)) // ["car", "bed", "sun"]
print("RESULT: ", solution(["abce", "abcd", "cdx"], 2)) // ["abcd", "abce", "cdx"]
