import UIKit

/// 13. DFS+
/// DFS, BFS를 풀기 위해서는 데이터를 그래프로 변환하는 작업이 필수적
/// -> 단, 모든 Node가 연결되어 있는 경우 visited만 구별해서 작업할 수도 있음
/// 아래는 인접 리스트 방식으로 데이터를 그래프화 하는 방식을 서술함
///
/// 구현방법
/// 1. 딕셔너리에 Node 값과 간선을 저장할 array를 만듦 ([Node: [Array]])
/// 2. 데이터에 for를 돌려 하나하나 검증함
/// 3. 딕셔너리 key 값에 해당 데이터가 있는 지 확인
/// - 만약 있을 경우 해당 배열에 새로운 데이터를 append 함
/// - 없을 경우 새로운 array를 key에 등록함
///
/// DFS
/// DFS는 모든 경우의 수를 구할 때 사용함
/// - 재귀나, Stack을 이용
/// - 재귀를 탈출할 때 무조건 return 값이 있어야 하는 것은 아니며, 간선이 없거나 잘못된 간선일 때 return 하는 구문도 존재해야함

var n = 5
var data = [[1, 2], [1, 3], [1, 4], [2, 1], [2, 4], [2, 5], [3, 2], [3, 4], [4, 5]]

func dataToGraph(_ data: [[Int]]) -> [Int: [Int]] {
    var graph: [Int : [Int]] = [:]
    
    for item in data {
        if var array = graph[item[0]] {
            array.append(item[1])
            graph[item[0]] = array
        } else {
            graph[item[0]] = [item[1]]
        }
    }
    
    return graph
}

func dfs(_ n: Int, graph: [Int: [Int]]) -> Int {
    var count = 0
    
    func check(_ visited: [Int], node: Int) {
        if node == n {
            count += 1
            return
        }
        guard let branchs = graph[node] else {return}
        for branch in branchs {
            if visited.contains(branch) {continue}
            check(visited + [branch], node: branch)
        }
    }
    check([1], node: 1)
    return count
}

let graph = dataToGraph(data)
print(graph)
print(dfs(n, graph: graph))

// 이전 공부 기록
//// 데이터 -> 그래프화
//func dataToGraph(data: [[Int]]) -> [Int: Array<Int>] {
//    var result = [Int: Array<Int>]()
//    
//    for n in data {
//        if var array = result[n[0]] {
//            array.append(n[1])
//            result[n[0]] = array
//        } else {
//            result[n[0]] = [n[1]]
//        }
//    }
//    return result
//}
//
//// 경우의 수 찾기 DFS
//func search(graph: [Int: Array<Int>], n: Int) -> Int {
//    var answer = 0
//    
//    func dfs(node: Int, visited: [Int]) {
//        if node == n {
//            // node가 n과 같으면 answer을 올리고 리턴
//            answer += 1
//            return
//        }
//        
//        // 연결된 간선이 없으면, 리턴
//        guard let branch = graph[node] else {return}
//        for x in branch {
//            // 이미 방문한 노드면 건너뜀
//            if visited.contains(x) {continue}
//            // 재귀
//            dfs(node: x, visited: visited + [x])
//        }
//    }
//    
//    dfs(node: 1, visited: [1])
//    return answer
//}
//
//
//let graph = dataToGraph(data: data)
//print(graph)
//
//print(search(graph: graph, n: n))
//
//// 그래프 순환 순서 찾기
//func dfs(_  n: Int) -> [Int] {
//    var visited = [Int]()
//    var need: [Int] = [n]
//    
//    while !need.isEmpty {
//        let node = need.removeLast()
//        if visited.contains(node) {continue}
//        visited.append(node)
//        need += graph[node] ?? []
//    }
//    
//    return visited
//}
//
//var answer = [[Int]]()
//for data in graph {
//    answer.append(dfs(data.key))
//}
//print(answer)
