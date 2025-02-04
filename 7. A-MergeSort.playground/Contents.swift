import UIKit

/// 7. MergeSort (합병정렬)
/// 퀵정렬과 동일하게 분활정복을 이용한 정렬 방식
/// - 재귀함수를 이용
/// - 배열을 나눌 수 없을 때까지 나눈 후 이를 합병하는 식으로 개발
///
/// 구현 방법
/// 1. 배열을 절반으로 잘라 2개의 배열로 나눔
/// - 배열의 count가 홀수 인 경우 한쪽으로 하나 더 배치
/// 2. 배열의 갯수가 1이 될때까지 1번 작업을 반복함
/// 3. 배열의 갯수가 1이 되어 재귀를 탈출할 때 나누어진 두 배열을 합병정렬을 통해 정렬 후 return 함
///
/// 합병정렬?
/// 2개의 배열을 0번 index부터 비교하며, 작은 값부터 나열하는 방법
/// - 왼쪽 배열의 index 0이 오른쪽 배열의 index 0보다 작으면 왼쪽 배열의 index 0 값을 먼저 배치 후
/// - 왼쪽 배열은 다음 index를 비교함 (오른쪽 index는 동일)
///
/// 합병정렬의 시간복잡도는 퀵정렬과 동일한 O(n log n)

// 이전 공부 기록
//// 예시 데이터
//var list = [1, 5, 9, 2, 10, 22, 4, 6, 20, 100, 22, 5, 1, 8, 20]
//
//func mergeSort(_ array: [Int]) -> [Int] {
//    // 재귀의 탈출 조건
//    if array.count <= 1 {return array}
//    
//    var mid = array.count / 2
//    var left = Array(array[0 ..< mid])
//    // 만약 홀 수 인경우 right에 넣기
//    var right = Array(array[mid ..< array.count])
//    
//    func merge(left: [Int], right: [Int]) -> [Int] {
//        var leftArray = left
//        var rightArray = right
//        var result: [Int] = []
//        
//        while !(leftArray.isEmpty) && !(rightArray.isEmpty) {
//            if leftArray[0] < rightArray[0] {
//                result.append(leftArray.removeFirst())
//            } else {
//                result.append(rightArray.removeFirst())
//            }
//        }
//        
//        // 만약 둘 중에 하나라도 남아 있으면
//        result.append(contentsOf: leftArray + rightArray)
//        
//        return result
//    }
//    
//    return merge(left: mergeSort(left), right: mergeSort(right))
//}
//
//print("BEFORE SORT")
//print(list)
//
//print("AFTER SORT")
//print(mergeSort(list))
