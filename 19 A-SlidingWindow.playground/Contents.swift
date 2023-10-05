import UIKit

// 배열의 일정 길이(윈도우)에 있는 데이터를 빠르게 알아내고 싶을 때 사용하는 알고리즘
// O(n)의 속도를 가지고 있음, Array로 구성

let value = [1, 2, 3, 4, 4, 4, 1, 2, 3, 4]
let k = 2 // 윈도우 길이

var maxData = 0 // 최대 데이터
var maxCount = 1 // 최대 데이터 카운트
var nowValue = 0 // 현재 값

for index in  0 ... value.count - k {
    if index == 0 {
        var sum = 0
        for f in 0 ..< k {
            sum += value[f]
        }
        nowValue = sum
        maxData = sum
        continue
    }
    
    // 현재 값 > 이전 index 값을 제거 후 K + index - 1 값을 더함(index는 0부터 시작이기 때문에 -1)
    nowValue = nowValue - value[index - 1] + value[index + k - 1]
    
    // 데이터가 같으면
    if nowValue == maxData {
        maxCount += 1
        // 데이터가 더 크면
    } else if nowValue > maxData {
        maxCount = 1
        maxData = nowValue
    }
}
print(maxData)
print(maxCount)
