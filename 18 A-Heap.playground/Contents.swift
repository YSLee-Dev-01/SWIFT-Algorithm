import UIKit

// 데이터의 최소값, 최대값을 빠르게 알아내고 싶을 때 사용하는 데이터 구조
// Heap은 완전 이진 트리로 구성되어 부모의 Index를 알 수 있기에, Array를 사용하여 구성

struct Heap<T: Comparable> {
    private var heap: [T] = []
    
    mutating func insert(data: T) {
        if self.heap.count <= 1 {
            self.heap.removeAll()
            self.heap.append(data)
            self.heap.append(data)
            // 데이터가 없을 경우 Heap 배열에 데이터를 추가하고 종료
            return
        }
        
        func isMove(_ index: Int) -> Bool {
            if index <= 1 {
                // root node인 경우
                return false
            }
            
            let parents = index / 2
            return self.heap[index] > self.heap[parents]
        }
        
        self.heap.append(data)
        var moveIndex = self.heap.count - 1
        
        while isMove(moveIndex) {
            let parents = moveIndex / 2
            self.heap.swapAt(moveIndex, parents)
            moveIndex = parents
        }
    }
    
    enum moveCase {
        case left
        case right
        case stop
    }
    mutating func pop() -> T? {
        if self.heap.count <= 1 {
            return nil
        }
        
        func isMove(_ index: Int) -> moveCase {
            let leftIndex = index * 2
            let rightIndex = leftIndex + 1
            
            // left node가 없을 때
            if leftIndex >= self.heap.count {
                return .stop
            }
            
            // right는 없고 left만 있을 때
            if rightIndex >= self.heap.count {
                return self.heap[leftIndex] > self.heap[index] ? .left : .stop
            }
            
            // root node가 값이 클 때
            if (self.heap[index] >= self.heap[leftIndex]) && (self.heap[index] >= self.heap[rightIndex]) {
                return .stop
            }
            
            // root node 값보다 left, right가 둘 다 클 때
            if (self.heap[index] < self.heap[leftIndex]) && (self.heap[index] < self.heap[rightIndex]) {
                if self.heap[rightIndex] < self.heap[leftIndex] {
                    return .left
                } else {
                    return .right
                }
            }
            
            // 이외
            if self.heap[rightIndex] < self.heap[leftIndex] {
                return .left
            } else {
                return .right
            }
        }
        
        self.heap.swapAt(1, self.heap.count - 1)
        let rootNode = self.heap.removeLast()
        var moveIndex = 1
        
        while true {
            switch isMove(moveIndex) {
            case .left:
                let nextIndex = moveIndex * 2
                self.heap.swapAt(moveIndex, nextIndex)
                moveIndex = nextIndex
            case .right:
                let nextIndex = (moveIndex * 2) + 1
                self.heap.swapAt(moveIndex, nextIndex)
                moveIndex = nextIndex
            case .stop:
                return rootNode
            }
        }
    }
    
    func showHeap() -> [T] {
        return Array(self.heap[1 ..< self.heap.count])
    }
}

var maxHeap = Heap<Int>()

maxHeap.insert(data: 1)
maxHeap.insert(data: 15)
maxHeap.insert(data: 100)
maxHeap.insert(data: 50)
print(maxHeap.showHeap())

maxHeap.pop()
print(maxHeap.showHeap())

maxHeap.pop()
print(maxHeap.showHeap())

maxHeap.pop()
print(maxHeap.showHeap())

maxHeap.pop()
print(maxHeap.showHeap())

maxHeap.insert(data: 7)
print(maxHeap.showHeap())
