import UIKit

// 배열에서 부분합을 O(n)으로 구하고 싶을 때 사용하는 알고리즘
// Start, End를 조정해가면서 연산함

var value = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var want = 10

var sum = 0
var start = 0
var end = 0
var range = [[Int]]()

while end < value.count {
    // sum 값이 want보다 작거나 같을 때
    if sum <= want {
        sum += value[end]
        end += 1
    } else {
        // sum 값이 더 클 때
        sum -= value[start]
        start += 1
    }
    if sum == want {
        range.append([start, end - 1])
    }
}

// end까지 연산 후 start를 추가하며, 값을 계산, 만약 want보다 작아질 경우 + 할 수 있는 값이 없기 때문에 Break
while start != end {
    if sum >= want {
        sum -= value[start]
        start += 1
    } else {
        break
    }
    if sum == want {
        range.append([start, end - 1])
    }
}
print(range)
