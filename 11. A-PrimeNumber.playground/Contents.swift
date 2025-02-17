import Foundation

/// 11. 소수
/// 단일 소수는 특정 숫자의 제곱근까지만 약수를 검증하면 됨
/// - 수가 수를 나누면 몫이 생기는데, 몫과 나누는 수 둘 중 하나는 제곱은 이하 이기 때문
///
/// 복수 소수를 구할 때는 에라토스테네스의 체 방법을 통해서 구할 수 있음
///
/// 구현방법
/// 1. 1부터 n+만큼 소수 여부를 파악하는 Bool 배열 생성
/// 2. N의 제곱근 > 변수로 반복문 생성
/// 3. 기준변수를 제곱으로 곱한 후 + 기준변수를 더하면서 배열의 값을 false로 설정
/// 4. 3번을 반복 한 후 반복문이 끝났을 때 배열 값들 중 true인 것이 소수

// 단일 소수 구하기
func primeNumber(_ n: Int) -> Bool {
    for x in 2 ... Int(sqrt(Double(n))) {
        if n % x == 0 {
            return true
        }
    }
    return false
}

print(primeNumber(100))
print(primeNumber(103))


// 복수 소수 구하기
func primeNumbers(_ n: Int) -> [Int] {
    var isPrimeNumbers = Array(repeating: true, count: n + 1)
    isPrimeNumbers[0] = false
    isPrimeNumbers[1] = false
    
    for x in 2 ... Int(sqrt(Double(n)) + 1) {
        if isPrimeNumbers[x] == false {continue}
        isPrimeNumbers[x] = false
        
        for y in stride(from: x * x, to: isPrimeNumbers.count, by: x) {
            isPrimeNumbers[y] = false
        }
    }
    return isPrimeNumbers.enumerated().filter {$0.element}.map {$0.offset}
}

print(primeNumbers(100))

// 이전 공부 기록
//func primeNumber(_ n: Int) -> [Int] {
//    var array: [Bool] = Array(repeating: true, count:  n + 1)
//    array[0] = false
//    array[1] = false
//
//    var point = 2
//    
//    func cross(_ array: inout [Bool], point: Int) {
//        for x in stride(from: point * point, to: array.count, by: point) {
//            array[x] = false
//        }
//    }
//    
//    func pointChange(_ array: [Bool], _ point: Int) -> Int{
//        var change = point + 1
//        
//        while array.count > change, !array[change] {
//            change += 1
//        }
//        
//        return change
//    }
//    
//    while point < (Int(sqrt(Double(n))) + 1) {
//        cross(&array, point: point)
//        point = pointChange(array, point)
//    }
//    
//    return array.enumerated().filter { $0.element }.map {$0.offset}
//}
//
//print(primeNumber(100))
