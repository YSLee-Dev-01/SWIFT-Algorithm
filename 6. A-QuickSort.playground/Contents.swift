import UIKit

/// 6. Quick Sort (퀵정렬)
/// 분활 알고리즘에 속하는 정렬 방법
///
/// 분활 알고리즘이란?
/// 문제를 나눌 수 없을 때까지 나누어 풀고,
/// 나눈 문제를 다시 합병하여 값을 얻는 알고리즘
/// - 하양식 접근법으로 주로 재귀함수를 통해 개발함
///
/// 퀵정렬은 배열을 나눌 수 없을 때까지 나눈 후,
/// 이를 정렬 후 합병하는 방식으로 개발함
///
/// 구현 방법
/// 1. 기준점 (pivot)을 기준으로 큰 값은 right, 작은 값은 left 배열로 따로 분리
/// 2. left, right의 수가 1개 이하가 될 때까지 1번 작업을 반복함
/// 3. 1개 이하가 된 left, right를 pivot을 기준으로 합침 (left + p + right)
///
/// 퀵정렬의 시간 복잡도는 O(n log n)으로 버블, 선택, 삽입 보다 빠른 알고리즘
/// - 단, 첫번째 Index가 가장 크거나 작은 값이면 O(n^2)

// 이전 공부 기록
//// 예시 데이터
//var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100, 22]
//
//func quickSort(_ list: [Int]) -> [Int] {
//    // list가 비어있거나, 하나만 있을 때는 리턴 (재귀함수의 탈출)
//    guard let first = list.first, list.count >= 1 else {return list}
//    
//    let pivot = first
//    var left: [Int] = []
//    var right: [Int] = []
//    
//    let array = list.enumerated().filter {$0.offset != 0}
//    
//    for x in array {
//        if pivot > x.element {
//            left.append(x.element)
//        } else {
//            right.append(x.element)
//        }
//    }
//    
//    return quickSort(left) + [pivot] + quickSort(right)
//}
//
//print("BEFORE SORT")
//print(list)
//
//print("AFTER SORT")
//print(quickSort(list))
