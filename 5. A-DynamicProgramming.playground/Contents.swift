import UIKit

/// 5. Dynamic Programming (동적 계획법) (DP)
/// 상향식 접근법으로 가장 작은 부분의 값을 계산하여 저장한 후,
/// 저장한 값을 이용하여 상위 문제를 푸는 방법
///
/// 저장은 Memoization이라고도하며, DP의 핵심 부분 중 하나
/// - 동일 계산을 반복해야할 때 이전에 계산한 값을 메모리에 저장하여 반복 수행을 제거함에 따라
///     프로그램의 실행속도를 빠르게 하는 것

// 이전 공부 기록
//// 피나보치의 수 -> 재귀함수
//func recursiveCallPina(_ num: Int) -> Int {
//    if num <= 1 {
//        return num
//    }
//    
//    return recursiveCallPina(num - 1) + recursiveCallPina(num - 2)
//}
//
//// 피나보치의 수 -> DP
//func dpPina(_ num: Int) -> Int {
//    var cache = [0, 1]
//    
//    for n in 2 ... num {
//        cache.append(cache[n-1] + cache[n-2])
//    }
//    
//    return cache[num]
//}
//
//
//print(recursiveCallPina(4))
//print(dpPina(4))
