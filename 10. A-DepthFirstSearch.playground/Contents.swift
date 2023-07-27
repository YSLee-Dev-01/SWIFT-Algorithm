import UIKit

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


func DFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [start]
    
    while !needVisitStack.isEmpty {
        let node = needVisitStack.removeLast() // Stack이기 때문에 마지막 데이터를 가져옴
        if visitedQueue.contains(node) {continue} // visitedQueue에 있는지 확인
        
        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
    }
    
    return visitedQueue
}

print(DFS(graph: graph, start: "A"))
