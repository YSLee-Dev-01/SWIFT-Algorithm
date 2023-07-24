import UIKit

// 예시 데이터
var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100, 22, 5, 1, 8, 20]

func mergeSort(_ array: [Int]) -> [Int] {
    // 재귀의 탈출 조건
    if array.count <= 1 {return array}
    
    var mid = array.count / 2
    var left = Array(array[0 ..< mid])
    // 만약 홀 수 인경우 right에 넣기
    var right = Array(array[mid ..< array.count])
    
    func merge(left: [Int], right: [Int]) -> [Int] {
        var leftArray = left
        var rightArray = right
        var result: [Int] = []
        
        while !(leftArray.isEmpty) && !(rightArray.isEmpty) {
            if leftArray[0] < rightArray[0] {
                result.append(leftArray.removeFirst())
            } else {
                result.append(rightArray.removeFirst())
            }
        }
        
        // 만약 둘 중에 하나라도 남아 있으면
        result.append(contentsOf: leftArray + rightArray)
        
        return result
    }
    
    return merge(left: mergeSort(left), right: mergeSort(right))
}

print("BEFORE SORT")
print(list)

print("AFTER SORT")
print(mergeSort(list))
