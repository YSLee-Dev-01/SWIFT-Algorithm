import UIKit

/// 14. BFS+
/// BFS 또한 DFS처럼 데이터를 그래프로 먼저 변환하는 작업을 거친 후 BFS를 사용할 수 있음 (모든 Node가 연결되어 있는 경우 제외)
///
/// BFS는 Weight를 가지지 않는 방향 그래프에서 최단/최소 경로를 구할 때 사용
/// - Queue 2개를 통해 구현

// 그래프로 전환
var n = 6
var data = [[1, 5], [2, 4], [2, 5], [3, 2], [3, 6], [4, 2], [4, 5], [5, 3], [5, 6]]

func dataToGraph(_ data: [[Int]]) -> [Int: Array<Int>] {
    var result = [Int: Array<Int>]()
    
    for x in data {
        if var array = result[x[0]] {
            array.append(x[1])
            result[x[0]] = array
        } else {
            result[x[0]] = [x[1]]
        }
    }
    
    return result
}

let graph = dataToGraph(data)
print(graph)

func search(_ graph: [Int: Array<Int>], startNode: Int) -> [ [Int] ]{
    var result: [[Int]] = []
    
    for x in 1 ... graph.count + 1 {
        var visited: [Int] = []
        var need = [startNode]
        
        while !need.isEmpty {
            var node = need.removeFirst()
            
            if visited.contains(node) {continue}
            visited.append(node)
            
            if node == x {
                result.append(visited)
                break
            }
            
            guard var branch = graph[node] else {
                visited.removeLast()
                continue
            }
            
            if branch.contains(x) {
                result.append(visited + [x])
                break
            }
            need.append(contentsOf: branch)
        }
    }
    return result
}

print(
    search(graph, startNode: 1)
)
