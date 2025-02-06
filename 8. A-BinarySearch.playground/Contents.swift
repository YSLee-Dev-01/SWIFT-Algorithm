import UIKit

/// 8. BinarySearch (이진탐색)
/// 탐색 알고리즘 중 하나로 탐색할 자료를 둘로 나누어 해당 데이터가 있을 곳을 탐색함
/// - 이진탐색은 정렬이 되어 있는 데이터에서만 사용이 가능함
///
/// 탐색이란?
/// - 여러 데이터 중 원하는 데이터를 찾아내는 것을 의미
///
/// 구현 방법
/// 1. 배열 가운데에 있는 데이터를 비교하여 해당 값이 (mid) 작을 경우 left, 클 경우 right로 이동하여 작업을 반복함
/// - 배열 가운데에 있는 데이터가 원하는 데이터인경우 탐색을 종료
///
/// 이진탐색은 완전탐색과 달리 O(log n)의 시간 복잡도를 가짐

// 이전 공부 기록
//// 예시 데이터
//var list = [1, 1, 2, 4, 5, 5, 6, 8, 9, 10, 20, 20, 22, 22, 100]
//
//func binarySearch(_ array: [Int], num: Int) -> Bool {
//    // 탈출조건
//    if array.count <= 1 { return array[0] == num }
//    
//    let mid = array.count / 2
//    
//    if array[mid] == num {return true}
//    
//    if array[mid] > num {
//        return binarySearch(Array(array[0..<mid]), num: num)
//    } else {
//        // mid는 이미 검수했기에 + 1
//        return binarySearch(Array(array[(mid + 1)..<array.count]), num: num)
//    }
//}
//
//func binarySearchFor(_ array: [Int], num: Int) -> Bool {
//    var start = 0
//    var end = array.count - 1
//    
//    while start <= end {
//        let mid = (start + end) / 2
//        
//        if array[mid] == num {return true}
//        
//        // mid는 이미 검수 했기에 +1, -1
//        if array[mid] > num {
//            end = mid - 1
//        } else {
//            start = mid + 1
//        }
//    }
//    
//    return false
//}
//
//print(binarySearch(list, num: 100))
//print(binarySearchFor(list, num: 2))
