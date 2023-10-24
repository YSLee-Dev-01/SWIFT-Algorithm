import UIKit

// 플로이드 워셜이란? 그래프에서 모든 Node의 최단경로를 찾기위해 사용하는 알고리즘
// 모든 Node의 최단경로를 찾을 때 사용함 (다익스트라와의 차이점)
// DP와 3중 For문을 활용해서 구현
// 지나가는 Node의 For K, 시작 Node의 For I, 도착 Node의 For J로 이루어짐, 인접행렬리스트 방식을 사용해야함

// 직접 연결되지 않는 노드는 최대값으로 초기화
// 자기 자신은 0으로 초기화
let graph = [
    [0, 100, 5],
    [100, 0, 2],
    [5, 3, 0]
]
let nodeNumber = 3
var floydWarshall = graph

for k in 0 ..< nodeNumber {
    for i in 0 ..< nodeNumber {
        for j in 0 ..< nodeNumber {
            // i = j = k 가 같으면 실행 안함
            if i == k || i == j || j == k {
                continue
            }
            floydWarshall[i][j] = min(floydWarshall[i][j] , floydWarshall[i][k] + floydWarshall[k][j] )
        }
    }
}

print(graph)
print(floydWarshall)
