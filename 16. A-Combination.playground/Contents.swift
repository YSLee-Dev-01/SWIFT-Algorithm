import UIKit

// n개의 개수에서 r개를 뽑는 수를 nCr로 표현
// nCr은 팩토리얼로 풀 수 있음
// n! / (r! * (n-r)!)

func combination(_ n:Int, r: Int) -> Int {
    var cache = [1]
    for x in 1 ..< n {
        cache.append(cache[x - 1] * (x + 1))
    }
    return cache[n - 1] / (cache[r - 1] * cache[n - r - 1])
}

print(combination(6, r: 3))
