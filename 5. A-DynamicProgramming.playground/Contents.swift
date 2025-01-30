import UIKit

/// 5. Dynamic Programming (동적 계획법) (DP)
/// 상향식 접근법으로 가장 작은 부분의 값을 계산하여 저장한 후,
/// 저장한 값을 이용하여 상위 문제를 푸는 방법
///
/// 저장은 Memoization이라고도하며, DP의 핵심 부분 중 하나
/// - 동일 계산을 반복해야할 때 이전에 계산한 값을 메모리에 저장하여 반복 수행을 제거함에 따라
///     프로그램의 실행속도를 빠르게 하는 것

/// 피나보치 수열
/// 내 앞에 취한 2개의 값을 사용하여 나를 만드는 것
/// - 0, 1, 1, 2, 3, 5, 8, 13, 22, ...
/// 피나보치의 점화식은 F(n-1) + F(n-2)

// 재귀함수를 사용한 피나보치 수열
func fibo(_ n: Int) -> Int {
    if n <= 1 {return n}
    /// 재귀함수를 사용할 경우 동일한 함수가 여러번 호출되기 때문에
    /// 실행속도가 감소할 수 있음
    /// 하단 구문도 n-1, n-2를 하기 때문에 중복된 함수를 부를 수 밖에 없는 구조
    return fibo(n - 1) + fibo(n - 2)
}

print(fibo(5))

func fiboWithDP(_ n: Int) -> Int {
    var result = [0, 1] // 작은 단위를 저장할 공간인 배열
    if let index = result.firstIndex(of: n) { // n이 0, 1 일 때
        return index
    }
    
    for x in 2 ... n {
        result.append(result[x - 1] + result[x - 2]) // 점화식
    }
    /// result 배열을 통해 이전 값을 이용하여 값을 도출하기 때문에 재귀함수 대비 속도가 빠름
    return result.last!
}

print(fiboWithDP(5))

/// 동적 계획법, 분할정복
/// 동적 계획법 및 분활정복 모두 가장 작은 단위로 분활하여 문제를 해결하지만,
/// 동적 계획법은 memorization 기법을 사용하며, 작은 단위로 쪼개진 문제는 상위 문제를 해결하는데 재사용 됨
/// 분할 정복은 memorization 기법을 사용하지 않으며, 작은 단위로 쪼개진 문제가 상위 문제를 해결하는데 재사용 되지 않음

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
