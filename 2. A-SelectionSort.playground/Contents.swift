import UIKit

/// 2. SelectionSort (선택정렬)
/// BubbleSort와 같이 간단한 정렬 중 하나
///
/// 구현방법
/// 1. 데이터 중 가장 작은 값을 찾음
/// 2. 가장 작은 데이터와 맨 앞 데이터를 교체함
/// 3. 맨 앞 데이터를 제외하고 위 과정을 반복함
/// - 0번 index부터 작은 값으로 정렬이 됨
///
/// BubbleSort와 비슷하게 가장 작은 값을 찾는 scan 작업을 하게 됨
/// scan 작업은 기준 index를 제외한 배열의 끝까지 확인하면 되기 때문에 기준 index + 1로 반복함
/// scan 작업이 1회 완료되면 가장 작은 값이 배열의 첫번째에 정렬되기 때문에 모든 값을 정렬하기 위해서는
/// 배열의 count - 1 만큼 scan 작업을 반복함
///
/// 반복문 내부에 반복문을 사용하기 때문에 O(n^2)의 시간 복잡도를 가짐


var intList = [20, 12, 5, 1, 100, 9, 50, 199, -14, -56]

func selectionSort(_ value: [Int]) -> [Int] {
    var sortedList = value
    
    for x in 0 ..< sortedList.count - 1 {
        var minIndex = x
        for y in x + 1 ..< sortedList.count {
            if sortedList[minIndex] > sortedList[y] {
                minIndex = y
            }
        }
        if x == minIndex {continue}
        sortedList.swapAt(x, minIndex)
    }
    return sortedList
}

print("원래 값")
print(intList)

print("정렬 후 값")
print(selectionSort(intList))

// 이전 공부 기록

//// 예시 데이터
//var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100]
//
//func selectionSort(_ list: inout [Int]) {
//    // 스캔을 몇번 반복할건지
//    for index in 0 ..< (list.count - 1) {
//        // 기준 index
//        var minIndex = index
//        
//        for swap in (minIndex + 1) ..< list.count {
//            if list[swap] < list[minIndex] {
//                minIndex = swap
//            }
//        }
//        
//        list.swapAt(index, minIndex)
//    }
//}
//
//print("BEFORE SORT")
//print(list)
//
//print("AFTER SORT")
//selectionSort(&list)
//
//print(list)
