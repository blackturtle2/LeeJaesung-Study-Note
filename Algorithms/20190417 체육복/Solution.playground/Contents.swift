// https://programmers.co.kr/learn/courses/30/lessons/42862

import Foundation

// 전체 학생의 수 n
// 체육복을 도난당한 학생들의 번호가 담긴 배열 lost
// 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve
// 체육수업을 들을 수 있는 학생의 최댓값을 return 하도록 solution 함수를 작성

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var `lost` = lost
    var `reserve` = reserve

    lost = lost.filter({ (item) -> Bool in
        var isFilter = true
        reserve = reserve.filter({
            if item != $0 { isFilter = false }
            return item != $0
        })
        return isFilter
    })
    var result = n - lost.count
    print("reserve: ", reserve)

    lost.forEach { (item) in
        result += reserve.reversed().filter({
            let isMatching = item == $0 - 1 || item == $0 + 1
            if isMatching { reserve.popLast() }
            return isMatching
        }).count
    }

    return result
}

print("RESULT 1: ", solution(5, [2, 4], [1, 3, 5])) // 5
print("RESULT 2: ", solution(5, [2, 4], [3])) // 4
print("RESULT 3: ", solution(3, [3], [1])) // 2
print("RESULT 4: ", solution(3, [1, 2], [2, 3])) // 2

print("\nRESULT 1: ", solution(3, [2, 3], [1])) // 2
print("RESULT 2: ", solution(18, [7, 8, 11, 12], [1, 6, 8, 10])) // 17
print("RESULT 3: ", solution(24, [12, 13, 16, 17, 19, 20, 21, 22], [1, 22, 16, 18, 9, 10])) // 19
print("RESULT 4: ", solution(6, [1, 3, 4, 5], [1, 4])) // 4
