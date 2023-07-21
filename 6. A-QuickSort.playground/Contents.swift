import UIKit

// 예시 데이터
var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100, 22]

func quickSort(_ list: [Int]) -> [Int] {
    // list가 비어있거나, 하나만 있을 때는 리턴 (재귀함수의 탈출)
    guard let first = list.first, list.count >= 1 else {return list}
    
    let pivot = first
    var left: [Int] = []
    var right: [Int] = []
    
    let array = list.enumerated().filter {$0.offset != 0}
    
    for x in array {
        if pivot > x.element {
            left.append(x.element)
        } else {
            right.append(x.element)
        }
    }
    
    return quickSort(left) + [pivot] + quickSort(right)
}

print("BEFORE SORT")
print(list)

print("AFTER SORT")
print(quickSort(list))
