import UIKit

// 재귀함수를 쓰지 않은 Factorial
func factorial(_ num: Int) -> Int {
    var result = 1
    
    for item in 2 ... num {
        result *= item
    }
    
    return result
}

// 재귀함수를 사용한 Factorial
func factorialWithRecursiveCall(_ num: Int) -> Int {
    if num < 2 {
        return num
    }
    
    return num * factorialWithRecursiveCall(num - 1)
}

// 꼬리재귀 함수를 사용한 Factorial
func factorialWithRecursiveCallP(_ num: Int, _ result: Int) -> Int {
    if num < 2 {
        return result
    }
    
    return factorialWithRecursiveCallP(num - 1, num * result)
}

print(factorial(4))
print(factorialWithRecursiveCall(4))
print(factorialWithRecursiveCallP(4, 1))
