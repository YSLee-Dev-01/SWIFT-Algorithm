import UIKit

/// 1. BubbleSort (버블 정렬)
/// 구현이 간단한 정렬 방법 중 하나
///
/// 구현방법
/// 1. 두 인접한 데이터를 비교하여, 다음 index 값 보다 현재 index 값이 더 클 경우 둘의 자리를 변경함
/// 2. 해당 작업을 정렬이 끝날 때 까지 반복함
///
/// 두 인접한 데이터를 비교하여 자리를 변경하는 것을 swap이라고 칭함
/// swap은 나와 내 다음 값을 비교하기 때문에 배열의 count - 1만큼만 반복하면 됨
/// swap 한번이 완료될 때마다 배열에서 가장 큰 수가 정렬됨
/// - 배열의 모든 값을 정렬하기 위해서는 swap을 배열의 count - 1만큼 반복해야함
/// - 이미 정렬된 값은 swap을 할 필요가 없기 때문에 swap이 반복될 경우 swap 범위가 줄어들게 됨
///
/// 반복문 내부에 반복문을 사용하기 때문에 O(n^2)의 시간 복잡도를 가짐

// 이전 공부 기록
//// 예시 데이터
//var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100]
//
//// 스왑 작업을 몇번 반복할 지
//func bubbleSort(list: inout [Int]) {
//    for index in 0 ..< list.count - 1 {
//        // swap 작업
//        var isSwap = false
//        for swapIndex in 0 ..< ((list.count - 1) - index) {
//            if list[swapIndex] > list[swapIndex + 1] {
//                list.swapAt(swapIndex, swapIndex + 1)
//                
//                isSwap = true
//            }
//        }
//        
//        if isSwap == false {return}
//    }
//}
//
//print("BEFORE SORT")
//print(list)
//
//print("AFTER SORT")
//bubbleSort(list: &list)
//
//print(list)
