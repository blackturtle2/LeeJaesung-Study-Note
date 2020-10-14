// https://programmers.co.kr/learn/courses/30/lessons/42748?language=swift

import UIKit

func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    return commands.map { array[($0[0]-1)...($0[1]-1)].sorted()[$0[2]-1] }
}

print("RESULT: ", solution([1,5,2,6,3,7,4], [[2,5,3], [4,4,1], [1,7,3]])) // [5, 6, 3]

let testArray = [0,1,2,3,4,5]
let newArray = testArray[0..<3]

