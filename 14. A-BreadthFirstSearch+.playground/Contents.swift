import UIKit

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
