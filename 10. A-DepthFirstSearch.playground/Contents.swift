import UIKit

/// 10. DFS (깊이우선탐색)
/// DFS는 BFS와 동일하게 그래프를 탐색하는 방법 중 하나로, 탐색하려는 노드의 자식부터 우선 탐색하는 방식
/// - 데이터는 그래프화가 되어 있어야만 사용이 가능
///
/// DFS는 탐색노드(Root)의 인접노드의 자식들을 모두 탐색한 다음, 다시 돌아가서 탐색노드의 다른 인접노드의 자식까지 탐방함
/// BFS와는 다르게 같은 Level의 노드를 다 탐색하지 않고, 자식 Level의 노드까지 전부 탐색해야 인접 노드를 탐색할 수 있음
///
/// 구현방법
/// 1. DFS는 하나의 Stack과 하나의 Queue로 구현
/// - 방문해야하는 노드를 기록하는 Stack과, 이미 방문한 노드를 기록하는 Queue로 구성함
/// - 아래에는 방문 해야하는 노드를 Stack, 이미 방문한 노드를 queue로 표현함
///
/// 2. Stack에 탐색노드(Root)를 넣고, Stack의 값이 없을 때까지 반복문을 실행함
///
/// 3. Stack에 pop을 통해 마지막 값을 가져온 후, queue에 접근한 내역이 있는지 확인함
/// - 내역이 있으면 해당 값은 버리고, 다시 pop을 통해 3번 작업을 반복함
/// - 내역이 없으면 queue에 enQueue를 통해 값을 넣고, 연결된 간선을 Stack에 Push함
///
/// 4. queue에 저장된 값이 DFS를 통해 탐색된 순서
///
/// DFS는 재귀함수로도 구현이 가능함
///
/// DFS는 O(V+E)의 시간복잡도를 가짐 (V는 노드의 수, E는 간선)(BFS와 동일)

// 예시 그래프
let graph: [String: [String]] = [
    "A": ["B", "C"],
    "B": ["A", "D"],
    "C": ["A", "L"],
    "D": ["B", "E"],
    "E": ["D", "F", "G"],
    "F": ["E", "H"],
    "G": ["E", "I"],
    "I": ["G"],
    "L": ["C"],
    "H": ["F"]
]

func dfs(_ graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needStack: [String] = [start]
    
    while !needStack.isEmpty {
        let popValue = needStack.removeLast()
        if visitedQueue.contains(popValue) { continue }
        visitedQueue.append(popValue)
        needStack.append(contentsOf: graph[popValue] ?? [])
    }
    
    return visitedQueue
}

print(dfs(graph, start: "A"))

func dfsWithRC(_ graph: [String: [String]], visited: [String], need: [String]) -> [String] {
    if need.isEmpty {
        return visited
    }
    
    var nextNeed = need
    var nextVisited = visited
    
    let popValue = nextNeed.removeLast()
    if !nextVisited.contains(popValue) {
        nextVisited.append(popValue)
        nextNeed.append(contentsOf: graph[popValue] ?? [])
    }
    return dfsWithRC(graph, visited: nextVisited, need: nextNeed)
}

print(dfsWithRC(graph, visited: [], need: ["A"]))

// 이전 공부 기록
//// 예시 그래프
//let graph: [String: [String]] = [
//    "A": ["B", "C"],
//    "B": ["A", "D"],
//    "C": ["A", "L"],
//    "D": ["B", "E"],
//    "E": ["D", "F", "G"],
//    "F": ["E", "H"],
//    "G": ["E", "I"],
//    "I": ["G"],
//    "L": ["C"],
//    "H": ["F"]
//]
//
//
//func DFS(graph: [String: [String]], start: String) -> [String] {
//    var visitedQueue: [String] = []
//    var needVisitStack: [String] = [start]
//    
//    while !needVisitStack.isEmpty {
//        let node = needVisitStack.removeLast() // Stack이기 때문에 마지막 데이터를 가져옴
//        if visitedQueue.contains(node) {continue} // visitedQueue에 있는지 확인
//        
//        visitedQueue.append(node)
//        needVisitStack += graph[node] ?? []
//    }
//    
//    return visitedQueue
//}
//
//print(DFS(graph: graph, start: "A"))
