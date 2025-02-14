import UIKit

/// 12. 최대공약수/최소공배수
/// 최대공약수는 유클리드 화재법을 응용해서 품
///
/// 유클리드 화재법
/// A/B의 나머지인 R과 B/R의 최대공약수는 같다. (단 A > B로 가정)
/// - R/RR 의 최대공약수도 A와 B의 최대공약수와 같기 때문에 나머지가 없을때까지 반복하여 값을 구함
///
/// 최소공배수는 A * B는 최대공약수 * 최소공배수라는 것을 응용하여
/// - (A*B) / 최대공약수를 통해 최소공배수를 구함

func gcd(a: Int, b: Int) -> Int {
    if a % b == 0 {
        return b
    }
    return gcd(a: b, b: a % b)
}

func lcm(a: Int, b: Int) -> Int {
    return (a * b) / gcd(a: a, b: b)
}

print(gcd(a: 10, b: 50))
print(lcm(a: 10, b: 50))

// 이전 공부 기록
//func GCD(a: Int, b: Int) -> Int {
//    if a % b == 0 {return b}
//    return GCD(a: b, b: a % b)
//}
//
//func LCM(a: Int, b: Int) -> Int {
//    (a * b) / GCD(a: a, b: b)
//}
//
//print(GCD(a: 25, b: 7))
//print(LCM(a: 25, b: 7))
