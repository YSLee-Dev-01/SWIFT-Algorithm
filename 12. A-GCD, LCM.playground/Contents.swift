import UIKit

func GCD(a: Int, b: Int) -> Int {
    if a % b == 0 {return b}
    return GCD(a: b, b: a % b)
}

func LCM(a: Int, b: Int) -> Int {
    (a * b) / GCD(a: a, b: b)
}

print(GCD(a: 25, b: 7))
print(LCM(a: 25, b: 7))
