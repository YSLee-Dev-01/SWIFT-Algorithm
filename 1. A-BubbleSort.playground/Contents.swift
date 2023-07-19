import UIKit

// 예시 데이터
var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100]

// 스왑 작업을 몇번 반복할 지
func bubbleSort(list: inout [Int]) {
    for index in 0 ..< list.count - 1 {
        // swap 작업
        var isSwap = false
        for swapIndex in 0 ..< ((list.count - 1) - index) {
            if list[swapIndex] > list[swapIndex + 1] {
                list.swapAt(swapIndex, swapIndex + 1)
                
                isSwap = true
            }
        }
        
        if isSwap == false {return}
    }
}

print("BEFORE SORT")
print(list)

print("AFTER SORT")
bubbleSort(list: &list)

print(list)
