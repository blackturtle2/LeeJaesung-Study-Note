// https://programmers.co.kr/learn/courses/30/lessons/42840

import UIKit

func solution(_ answers: [Int]) -> [Int] {
    let student0 = [1, 2, 3, 4, 5]
    let student1 = [2, 1, 2, 3, 2, 4, 2, 5]
    let student2 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

    var count = [0, 0, 0]
    var result = [Int]()
    var i = 0

    answers.forEach {
        if $0 == student0[i % (student0.count)] { count[0] += 1 }
        if $0 == student1[i % (student1.count)] { count[1] += 1 }
        if $0 == student2[i % (student2.count)] { count[2] += 1 }

        i += 1
    }

    i = 1
    count.forEach {
        if $0 == count.max()! { result.append(i) }
        i += 1
    }

    return result
}

print("RESULT 1: ", solution([1, 2, 3, 4, 5])) // [1]
print("RESULT 2: ", solution([1, 3, 2, 4, 2])) // [1,2,3]
