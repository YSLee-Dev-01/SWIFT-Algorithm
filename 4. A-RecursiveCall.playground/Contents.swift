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
    
    /// num이 1이 되기 전까지 Stack에 함수를 쌓다가, num이 1이 되어 return 될 경우
    /// 가장 마지막에 호출된 함수부터 차례차례 자신의 값을 반환하여 맨 처음에 호출된 함수까지 Stack에
    /// 쌓인 모든 함수가 return 되는 것
    /// - 상단의 return (factorialWithRecursiveCall(num - 1)로 결과 값이 return
    /// -> 원래 자신을 호출했던 구문으로 돌아감
}

print(factorialWithRecursiveCall(4))

/// 재귀함수는 탈출조건이 없으면 무한루프에 빠질 수 있기 때문에 탈출 조건을 무조건 정의 해야함
/// 재귀함수는 반복문으로 가능한 것들을 효율적으로 구현하기 위해서 사용
/// - 반복문으로도 동일한 처리가 가능함
///
/// 그렇기 때문에 시간 복잡도는 O(n)을 가짐
/// 단, 공간복잡도는 재귀함수의 호출이 n번을 가질 수 있기 때문에 O(n)을 가짐 (for은 호출은 1번 뿐이기에 O(1))
/// Stack에 함수를 여러번 쌓기 때문에 스택오버플로우가 발생할 수 도 있음
/// - 이를 해결하기 위해 꼬리재귀 함수를 사용하기도 함
///
/// 꼬리재귀 함수
/// 기존 재귀함수의 스택오버플로우를 방지하고, 메모리를 효율적으로 사용하기 위해서 사용
/// 계산의 누적을 담는 파라미터를 만들어, 스택을 다시 return 하는 것이 아닌 파라미터만 리턴함

/// 꼬리재귀 함수를 사용한 factorial
func factorialWithRecursiveCall(_ num: Int, _ result: Int) -> Int {
    if num == 1 {
        return result
    }
    return factorialWithRecursiveCall(num - 1, num * result)
}

print(factorialWithRecursiveCall(4, 1))

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
