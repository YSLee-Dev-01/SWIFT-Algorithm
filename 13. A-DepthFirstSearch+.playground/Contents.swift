import UIKit

var n = 5
var data = [[1, 2], [1, 3], [1, 4], [2, 1], [2, 4], [2, 5], [3, 2], [3, 4], [4, 5]]

// 데이터 -> 그래프화
func dataToGraph(data: [[Int]]) -> [Int: Array<Int>] {
    var result = [Int: Array<Int>]()
    
    for n in data {
        if var array = result[n[0]] {
            array.append(n[1])
            result[n[0]] = array
        } else {
            result[n[0]] = [n[1]]
        }
    }
    return result
}

// 경우의 수 찾기 DFS
func search(graph: [Int: Array<Int>], n: Int) -> Int {
    var answer = 0
    
    func dfs(node: Int, visited: [Int]) {
        if node == n {
            // node가 n과 같으면 answer을 올리고 리턴
            answer += 1
            return
        }
        
        // 연결된 간선이 없으면, 리턴
        guard let branch = graph[node] else {return}
        for x in branch {
            // 이미 방문한 노드면 건너뜀
            if visited.contains(x) {continue}
            // 재귀
            dfs(node: x, visited: visited + [x])
        }
    }
    
    dfs(node: 1, visited: [1])
    return answer
}


let graph = dataToGraph(data: data)
print(graph)

print(search(graph: graph, n: n))
