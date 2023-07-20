import UIKit

// 피나보치의 수 -> 재귀함수
func recursiveCallPina(_ num: Int) -> Int {
    if num <= 1 {
        return num
    }
    
    return recursiveCallPina(num - 1) + recursiveCallPina(num - 2)
}

// 피나보치의 수 -> DP
func dpPina(_ num: Int) -> Int {
    var cache = [0, 1]
    
    for n in 2 ... num {
        cache.append(cache[n-1] + cache[n-2])
    }
    
    return cache[num]
}


print(recursiveCallPina(4))
print(dpPina(4))
