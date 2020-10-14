// https://programmers.co.kr/learn/courses/30/lessons/12910

import UIKit

func solution(_ arr: [Int], _ divisor: Int) -> [Int] {
    let result = arr.filter { $0 % divisor == 0 }.sorted()
    return result.count == 0 ? [-1] : result
}

print("RESULT 1: ", solution([5, 9, 7, 10], 5)) // [5, 10]
print("RESULT 2: ", solution([2, 36, 1, 3], 1)) // [1, 2, 3, 36]
print("RESULT 3: ", solution([3, 2, 6], 10)) // [-1]
