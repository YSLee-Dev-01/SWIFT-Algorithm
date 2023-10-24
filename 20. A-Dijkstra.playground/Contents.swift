import UIKit

// 다익스트라란? 그래프에서 최단경로를 찾기위해 사용하는 알고리즘
// 단일출발 최단경로를 찾을 때 사용함 (A> 연결된 모든 노드의 최단경로)
// 한개의 배열(컬렉션 타입)와 우선순위큐 (Heap 기준으로 최소힙)를 사용해서 구현

struct Heap<T: Comparable> {
    private var heap = [T]()
    var sortBy: (T, T) -> Bool
    
    init (
        sortBy: @escaping (T, T) -> Bool
    ) {
        self.sortBy = sortBy
    }
    
    mutating func enQueue(_ value: T) {
        if self.heap.count <= 1 {
            self.heap.removeAll()
            self.heap.append(value)
            self.heap.append(value)
            return
        }
        
        func isMove(_ index: Int) -> Bool {
            if index <= 1 {
                return false
            }
            let parents = index / 2
            
            return self.sortBy(self.heap[index], self.heap[parents])
        }
        
        self.heap.append(value)
        var index = self.heap.count - 1
        
        while(isMove(index)) {
            let parents = index / 2
            self.heap.swapAt(index, parents)
            index = parents
        }
    }
    
    enum MoveCase {
        case left
        case right
        case stop
    }
    mutating func deQueue() -> T? {
        if self.heap.count <= 1 {
            return nil
        }
        
        func isMove(_ index: Int) -> MoveCase {
            let left = index * 2
            let right = left + 1
            
            if self.heap.count <= left {
                return .stop
            }
            
            if self.heap.count <= right {
                return self.sortBy(self.heap[index], self.heap[left]) ? .stop : .left
            }

            if self.sortBy(self.heap[index], self.heap[left]) && self.sortBy(self.heap[index], self.heap[right]) {
                if self.sortBy(self.heap[left], self.heap[right]) {
                    return .left
                } else {
                    return .right
                }
            }
            if self.sortBy(self.heap[left], self.heap[right]) {
                return .left
            } else {
                return .right
            }
        }
        
        self.heap.swapAt(1, self.heap.count - 1)
        let value = self.heap.removeLast()
        var index = 1
        
        while true {
            switch isMove(index) {
            case .left:
                let left = index * 2
                self.heap.swapAt(index, left)
                index = left
            case .right:
                let right = (index * 2) + 1
                self.heap.swapAt(index, right)
                index = right
            case .stop:
                return value
            }
        }
    }
    
    func isEmpty() -> Bool {
        self.heap.count <= 1
    }
}

// Heap에 들어가는 데이터가 여러개일 때는 자료구조를 만들어서 사용해도 좋음 (튜플도 가능)
struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.value > rhs.value
    }
    
    var name: String
    var value: Int
}

// 임의 그래프
let graph: [String: [String: Int]] = [
    "A" : ["B": 9, "C" : 1, "D" : 15],
    "B" : ["E": 10],
    "C" : ["B": 5, "E" : 3],
    "D" : ["E": 10],
    "E" : ["F": 7],
    "F" : [:]
]

var minQueue = Heap<Node>(sortBy: >)
var diikstra = [String: Int]()

for key in graph.keys {
    diikstra[key] = 100 // 문제에서 나온 최대 값을 넣음
}
// 시작 노드는 0으로 초기화
diikstra["A"] = 0

// 기본 값으로 시작 노드를 넣고 시작
minQueue.enQueue(Node(name: "A", value: 0))

// queue의 값이 없을 때 까지 반복
while !minQueue.isEmpty() {
    let min = minQueue.deQueue()!
    let node = graph[min.name]!
    
    for item in node {
        let next = min.value + item.value
        // 만약 기존 diikstra의 값보다 next 값이 더 작은 경우 덮어씌운 후 queue에 추가
        if diikstra[item.key]! > next {
            diikstra[item.key]! = next
            // queue가 계속 갱신되며 최소 값을 갱신
            minQueue.enQueue(Node(name: item.key, value: next))
        }
    }
}

print(diikstra)
