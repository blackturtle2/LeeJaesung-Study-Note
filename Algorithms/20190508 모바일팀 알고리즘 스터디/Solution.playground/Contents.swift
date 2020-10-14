// 출처: 강깡님
// 스택과 큐
/*
 스택을 구현하고 스택 2개를 활용하여 큐를 구현하시오.
 스택은 어레이리스트로 구현하시면 됩니당.
 */

import Foundation

class Queue {
    var stack_1: [Int] = []
    var stack_2: [Int] = []

    init(_ myValue: [Int]) {
        self.stack_1 = myValue
    }

    func enqueue(_ myValue: Int) {
        self.stack_1.append(myValue)
    }

    func dequeue() -> Int? {
        if stack_2.count == 0 {
            while stack_1.count != 1 {
                stack_2.append(stack_1.popLast()!)
            }

            return stack_1.popLast()
        } else {
            let result = stack_2.popLast()
            while stack_2.count != 0 {
                stack_1.append(stack_2.popLast()!)
            }

            return result
        }
    }
}

func solution(_ number: [Int]) -> [Int] {
    let testValue = Queue(number)
    testValue.enqueue(4)

    print("Dequeue1: ", testValue.dequeue() ?? "...")
    print("Dequeue2: ", testValue.dequeue() ?? "...")
    print("Dequeue3: ", testValue.dequeue() ?? "...")
    print("Dequeue4: ", testValue.dequeue() ?? "...")
    print("Dequeue5: ", testValue.dequeue() ?? "...")
    print("Dequeue6: ", testValue.dequeue() ?? "...")

    return []
}

print("RESULT: ", solution([1, 2, 3, 4, 5]), "\n") // [1,2,3]
print("RESULT: ", solution([4,5,6]), "\n") // [4,5,6]
