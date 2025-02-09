import UIKit

/// 9. BFS (너비우선탐색)
/// BFS는 그래프를 탐색하는 방법 중 하나로 인접한 노드를 우선 탐색하는 방식
/// - 그래프를 탐색하는 방법이기 때문에 데이터가 그래프화 되어있어야만 사용이 가능
///
/// BFS는 탐색노드(Root)부터 인접한 노드를 확인하는데, 같은 Level의 노드를 전부 탐색한 다음
/// 다음 Level의 노드를 탐색할 수 있음 (같은 Level의 노드를 다 탐색하지 않고는 다음 Level의 노드를 탐색할 수 없음)
///
/// 구현 방법
/// 1. BFS는 2개의 Queue를 통해 구현
/// - Queue는 이미 방문한 노드를 기록하는 Queue와, 방문 해야하는 노드를 기록하는 Queue로 나눔
/// - 아래에는 이미 방문한 노드를 visited, 방문 해야하는 노드를 need로 표현함
///
/// 2. 탐색노드(Root)를 needQueue에 넣고 needQueue의 값이 없을 때까지 반복문을 실행함
///
/// 3. needQueue에서 deQueue를 통해 첫번째 값을 가져온 후 visitedQueue에 접근한 내역이 있는지 확인함
/// - 만약 접근한 내역이 있으면, 해당 값을 버리고 다시, deQueue를 하여 3번 작업을 수행함
/// - 접근한 내역이 없으면 해당 값을 visitedQueue에 넣고, 해당 값과 연결된 간선을 needQueue에 추가함
///
/// 4. visitedQueue에 저장된 값(순서)이 BFS를 통해 탐색되 순서
///
/// BFS는 O(V+E)의 시간복잡도를 가짐 (V는 노드의 수, E는 간선)

// 예시 그래프
let graph: [String: [String]] = [
    "A": ["B", "C"],
    "B": ["A", "D", "E"],
    "C": ["A", "F", "G"],
    "D": ["B"],
    "E": ["B"],
    "F": ["C"],
    "G": ["C"]
]

func bfs(_ graph: [String: [String]], startNode: String) -> [String] {
    var visitedNode: [String] = []
    var needNode: [String] = [startNode]
    
    while !needNode.isEmpty {
        let firstNode = needNode.removeFirst()
        if visitedNode.contains(firstNode) {continue}
        
        visitedNode.append(firstNode)
        needNode.append(contentsOf: graph[firstNode] ?? [])
    }
    
    return visitedNode
}

print(bfs(graph, startNode: "A"))

// 이전 공부 기록
//// 예시 그래프
//let graph: [String: [String]] = [
//    "A": ["B", "C"],
//    "B": ["A", "D", "E"],
//    "C": ["A", "F", "G"],
//    "D": ["B"],
//    "E": ["B"],
//    "F": ["C"],
//    "G": ["C"]
//]
//
//func BFS(graph: [String :[String]], start: String) -> [String]{
//    var visitedQueue: [String] = []
//    var needQueue: [String] = [start] // 기본 값으로 start값을 줌
//    
//    while !needQueue.isEmpty {
//        let node = needQueue.removeFirst()
//        
//        // needQueue의 맨 앞 데이터가 visitedQueue 존재하면
//        if visitedQueue.contains(node) {
//            continue // 아래 구문 실행 X
//        }
//        
//        visitedQueue.append(node)
//        // 연결된 간선들을 needQueue에 추가
//        needQueue += graph[node] ?? []
//    }
//    
//    return visitedQueue
//}
//
//print(BFS(graph: graph, start: "A"))
