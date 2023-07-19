import UIKit

// 예시 데이터
var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100]

func selectionSort(_ list: inout [Int]) {
    // 스캔을 몇번 반복할건지
    for index in 0 ..< (list.count - 1) {
        // 기준 index
        var minIndex = index
        
        for swap in (minIndex + 1) ..< list.count {
            if list[swap] < list[minIndex] {
                minIndex = swap
            }
        }
        
        list.swapAt(index, minIndex)
    }
}

print("BEFORE SORT")
print(list)

print("AFTER SORT")
selectionSort(&list)

print(list)
