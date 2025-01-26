import UIKit

/// 4. RecursiveCall (재귀함수)
/// 내 함수 안에서 내 함수를 호출하는 것
/// - 보통 원하는 값이 있을 때 까지 함수 호출을 반복하게 됨
/// - 잘 사용 시 코드가 간단해지고, 알고리즘 작성 시 자주 사용
///
/// RecursiveCall을 사용하는 예시는 factorial로 대체
///
/// factorial
/// 내 수와 같거나 작은 양의 수를 모두 곱하는 것
/// n!을 사용하여 표기함 (느낌표)
/// - 4! = 4 * 3 * 2 * 1 을 뜻 함

// 재귀함수를 쓰지 않은 factorial
func factorial(_ num: Int) -> Int {
    var result = 1
    
    for x in 2 ... num {
        result *= x
    }
    
    return result
}

print(factorial(4))

// 재귀함수를 사용한 factorial
func factorialWithRecursiveCall(_ num: Int) -> Int {
    /// 재귀함수를 사용하여 코드 구현 시 단계적으로 접근이 필요함
    /// 예시로 4!은
    /// 4! = 3! * 4
    /// 3!= 2! * 3
    /// 2! = 1! * 2
    /// 1! = 1
    /// = n!을 구하기 위해서는 (n-1)! * n을 하면 됨
    /// - (n-1!)은 ...?
    /// - (n-2!) * n-1로 구하면 됨
    /// 즉 n이 1이 될 때까지 factorial을 반복해서 구하면 됨
    /// - 1!은 1이기 때문
    /// - factorial을 반복할 때마다 n-1을 하여 호출
    
    if num == 1 {return num} // factorial 값이 1이 된 경우 num 값을 리턴
    return factorialWithRecursiveCall(num - 1) * num
}

print(factorialWithRecursiveCall(4))

// 이전 공부 기록
//// 재귀함수를 쓰지 않은 Factorial
//func factorial(_ num: Int) -> Int {
//    var result = 1
//    
//    for item in 2 ... num {
//        result *= item
//    }
//    
//    return result
//}
//
//// 재귀함수를 사용한 Factorial
//func factorialWithRecursiveCall(_ num: Int) -> Int {
//    if num < 2 {
//        return num
//    }
//    
//    return num * factorialWithRecursiveCall(num - 1)
//}
//
//// 꼬리재귀 함수를 사용한 Factorial
//func factorialWithRecursiveCallP(_ num: Int, _ result: Int) -> Int {
//    if num < 2 {
//        return result
//    }
//    
//    return factorialWithRecursiveCallP(num - 1, num * result)
//}
//
//print(factorial(4))
//print(factorialWithRecursiveCall(4))
//print(factorialWithRecursiveCallP(4, 1))
