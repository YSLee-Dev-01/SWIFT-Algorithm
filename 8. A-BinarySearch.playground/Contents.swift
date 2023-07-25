import UIKit

// 예시 데이터
var list = [1, 1, 2, 4, 5, 5, 6, 8, 9, 10, 20, 20, 22, 22, 100]

func binarySearch(_ array: [Int], num: Int) -> Bool {
    // 탈출조건
    if array.count <= 1 { return array[0] == num }
    
    let mid = array.count / 2
    
    if array[mid] == num {return true}
    
    if array[mid] > num {
        return binarySearch(Array(array[0..<mid]), num: num)
    } else {
        // mid는 이미 검수했기에 + 1
        return binarySearch(Array(array[(mid + 1)..<array.count]), num: num)
    }
}

func binarySearchFor(_ array: [Int], num: Int) -> Bool {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] == num {return true}
        
        // mid는 이미 검수 했기에 +1, -1
        if array[mid] > num {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return false
}

print(binarySearch(list, num: 100))
print(binarySearchFor(list, num: 2))
