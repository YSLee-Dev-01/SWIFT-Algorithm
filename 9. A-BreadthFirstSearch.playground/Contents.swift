import UIKit

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

func BFS(graph: [String :[String]], start: String) -> [String]{
    var visitedQueue: [String] = []
    var needQueue: [String] = [start] // 기본 값으로 start값을 줌
    
    while !needQueue.isEmpty {
        let node = needQueue.removeFirst()
        
        // needQueue의 맨 앞 데이터가 visitedQueue 존재하면
        if visitedQueue.contains(node) {
            continue // 아래 구문 실행 X
        }
        
        visitedQueue.append(node)
        // 연결된 간선들을 needQueue에 추가
        needQueue += graph[node] ?? []
    }
    
    return visitedQueue
}

print(BFS(graph: graph, start: "A"))
