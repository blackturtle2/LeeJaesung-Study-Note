// https://programmers.co.kr/learn/courses/30/lessons/12917
// 문자열 내림차순으로 배치하기
/*
 문자열 s의 문자를 큰것부터 작은 순으로 정렬.
 새로운 문자열 리턴.
 대문자는 소문자보다 작은 것으로 간주.
 */

import Foundation

func solution(_ s:String) -> String {
//    return s.sorted(by: {$0 > $1}).reduce("") {"\($0)"+"\($1)"}
//    return String(s.sorted(by: {$0 > $1}))
    return String(s.sorted(by: >))
}

print("RESULT: ", solution("Zbcdefg")) // "gfedcbZ"
