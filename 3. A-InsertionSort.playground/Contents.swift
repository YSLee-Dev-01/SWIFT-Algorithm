import UIKit

/// 3. InsertionSort (삽입정렬)
/// Bubble, Selection과 같이 간단한 정렬 중 하나
///
/// 구현방법
/// 1. 시작은 index 1부터 시작
/// 2. 기준 index로 부터 가장 인접한 이전 index 부터 swap 작업을 진행함
/// 3. 기준 index 보다 값이 작은 값이 나올 때까지 swap을 계속 진행함 -> 자리 변경
/// 4. 기준 index 보다 작은 값이 나온 경우 swap을 중지하며, 기준 index의 다음 index로 기준을 변경 후
/// 2번 과정을 반복함
///
/// swap은 index에서 1을 더한 상태로 진행되기 때문에, 배열의 count - 1만큼 scan 작업을 반복함
/// Bubble, Selection 정렬과 달리 Insertion 정렬은 큰/작은 값 기준으로 차례차례 정렬되지는 않음
///
/// 반복문을 내부에 반복문을 사용하기 때문에 O(n^2)의 시간복잡도를 가짐
/// - Bubble, Selection 보다는 빠른 편임
/// - 빅오표기법은 최악의 시간만을 나타내기 때문에 시간 복잡도는 동일함

var intList = [1, 9, 10, 12, 100, 155, -99, 23, -1, 0, 5]

func insertionSort(_ value: [Int]) -> [Int] {
    var sortedList = value
    
    for x in 1 ..< sortedList.count {
        for y in stride(from: x, to: 0, by: -1) {
            if sortedList[y] > sortedList[y - 1] {
                break
            }
            sortedList.swapAt(y, y - 1)
        }
    }
    return sortedList
}

print("원래 값")
print(intList)

print("정렬 후 값")
print(insertionSort(intList))

// 이전 공부 기록
//
//// 예시 데이터
//var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100]
//
//func insertionSort(_ list: inout [Int]) {
//    for index in 1 ..< list.count {
//        for swap in stride(from: index, to: 0, by: -1) {
//            if list[swap] < list[swap - 1] {
//                list.swapAt(swap, swap - 1)
//            } else {
//                break
//            }
//        }
//    }
//}
//
//print("BEFORE SORT")
//print(list)
//
//print("AFTER SORT")
//insertionSort(&list)
//
//print(list)
