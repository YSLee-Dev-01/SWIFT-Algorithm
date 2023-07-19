import UIKit

// 예시 데이터
var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100]

func insertionSort(_ list: inout [Int]) {
    for index in 1 ..< list.count {
        for swap in stride(from: index, to: 0, by: -1) {
            if list[swap] < list[swap - 1] {
                list.swapAt(swap, swap - 1)
            } else {
                break
            }
        }
    }
}

print("BEFORE SORT")
print(list)

print("AFTER SORT")
insertionSort(&list)

print(list)
