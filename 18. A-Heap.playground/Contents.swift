import UIKit

/// 18. Heap
/// 데이터에서 최소 값과 최대 값을 빠르게 찾기 위해 사용하는 완전이진트리
/// -> 완전이진트리란 왼쪽부터 자식이 채워지며, 마지막 Level이 아닌 Node는 자식을 가지고 있는 트리
///
/// 최대힙과 최소힙으로 구성되어 있음
/// 최대힙은 내 Node의 값은 자식 Node보다 크거나 같아야 하며,
/// 최소힙의 내 Node 값은 자식의 Node보다 작거나 같아야 함
/// - 이러한 특성으로 인해 RootNode가 최대힙인 경우 가장 큰 값을, 최소힙인 경우 가장 작은 값을 나타냄
///
/// 구현방법
/// Heap은 BST와 다르게 완전이진트리를 사용하기 때문에 연결리스트가 아닌 Array를 사용하여 구현
/// - 완전이진트리 특성 상 부모와 자식 Node 간의 관계를 Index로 나타낼 수 있기 때문
/// - 완전이진트리는 왼쪽 Node부터 차례차례 채워지며, 마지막 Level이 아니면 자식을 가지고 있기 때문에,
/// - 자식이 부모의 index를 확인할 때는 자신 index / 2,
/// - 부모가 자식의 index를 확인할 때는 자신 index * 2 (오른쪽인 경우 + 1)을 하면 알 수 있음
///
/// insert
/// 1. 완전 이진 트리에 맞춰서 데이터를 append
/// 2. 삽입된 데이터가 부모의 Node 보다 크/작을 때까지 Swap 작업 진행
///
/// pop
/// - Heap에서 pop은 가장 작은/큰 값인 RootNode를 꺼내는 것과 동일
/// 1. RootNode인 값을 복사 후 가장 마지막 데이터와 Swap
/// 2. 이동된 마지막 데이터와 자식 Node 간의 데이터를 비교하며 큰거나 작을 때 까지 Swap 작업을 반복
/// - 자식간의 Node를 비교할 때에는 왼쪽, 오른쪽 Node간의 데이터도 전부 비교해야함
/// - 1. 자식 노드가 있는지 -> 정지
/// - 2. 오른쪽 자식 노드가 있는지 -> 왼쪽 노드만 비교
/// - 3. 왼쪽 자식 노드와 오른쪽 자식 노드가 본인보다 크거나 작은지 ->  더 크거나 작은쪽으로 이동
/// - 4. 3번에 해당하지 않아 둘 중의 한 자식 노드만 큰경우 각각 비교
/// - 5. 자식 노드가 자신에 비해 크거나 작지 않은지 -> 정지
///
/// Heap의 시간복잡도는 O(log n)으로 배열의 O(n)보다 빠름

struct MaxHeap<T: Comparable> {
    private var heap: [T] = []
    
    init(data: T) {
        heap.append(data) // 0번을 index로 사용할 경우 부모/자식의 index를 개발할 때 0번만 따로 처리해야하기 때문에 기준 index를 1로 시작
        heap.append(data)
    }
    
    mutating func insert(_ data: T) {
        heap.append(data)
        if heap.count <= 2 {return}
        
        var childIndex = (heap.count - 1)
        var parentIndex = (heap.count - 1) / 2
        while parentIndex > 0, heap[parentIndex] <= data {
            heap.swapAt(parentIndex, childIndex)
            childIndex = parentIndex
            parentIndex = parentIndex / 2
        }
    }
    
    mutating func pop() -> T? {
        if heap.count == 1 {return nil}
        let data = heap[1]
        let lastData = heap[heap.count - 1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        var index = 1
        while index < heap.count {
            var childIndex = index * 2
            
            if childIndex >= heap.count { // 자식이 없을 때
                break
            } else if childIndex + 1 >= heap.count { // 오른쪽 자식이 없을 때
                if lastData <= heap[childIndex] {
                    heap.swapAt(index, childIndex)
                    index = childIndex
                } else {
                    break
                }
            } else if lastData <= heap[childIndex], lastData < heap[childIndex + 1] { // 두개의 자식 값이 본인 보다 클 때
                if heap[childIndex] <= heap[childIndex + 1] {
                    heap.swapAt(index, childIndex + 1)
                    index = childIndex
                } else {
                    heap.swapAt(index, childIndex)
                    index = childIndex
                }
            } else if lastData <= heap[childIndex] { // 왼쪽 자식이 더 클 때
                heap.swapAt(index, childIndex)
                index = childIndex
            } else if lastData < heap[childIndex + 1] { // 오른쪽 자식이 더 클 때
                heap.swapAt(index, childIndex + 1)
                index = childIndex
            } else {
                break
            }
        }
        
        return data
    }
    
    func showHeap() {
        print(heap)
    }
}

var maxHeap = MaxHeap<Int>(data: 50)
maxHeap.insert(100)
maxHeap.insert(30)
maxHeap.insert(10)
maxHeap.showHeap()
print(maxHeap.pop() ?? -1)
maxHeap.showHeap()
print(maxHeap.pop() ?? -1)
maxHeap.showHeap()
print(maxHeap.pop() ?? -1)
maxHeap.showHeap()
print(maxHeap.pop() ?? -1)
maxHeap.showHeap()
print(maxHeap.pop() ?? -1)
maxHeap.showHeap()
maxHeap.insert(1)
maxHeap.showHeap()
maxHeap.insert(2)
maxHeap.showHeap()
maxHeap.insert(3)
maxHeap.showHeap()
maxHeap.insert(3)
maxHeap.showHeap()
maxHeap.insert(4)
maxHeap.showHeap()
maxHeap.insert(4)
maxHeap.showHeap()
maxHeap.insert(5)
maxHeap.showHeap()
print(maxHeap.pop() ?? -1)
maxHeap.showHeap()
print(maxHeap.pop() ?? -1)
maxHeap.showHeap()
print(maxHeap.pop() ?? -1)
maxHeap.showHeap()


// 이전 공부 기록
//// 데이터의 최소값, 최대값을 빠르게 알아내고 싶을 때 사용하는 데이터 구조
//// Heap은 완전 이진 트리로 구성되어 부모의 Index를 알 수 있기에, Array를 사용하여 구성
//
//struct Heap<T: Comparable> {
//    private var heap: [T] = []
//    private var sort: (T, T) -> Bool
//    
//    init(sort: @escaping (T, T) -> Bool) {
//        self.sort = sort
//    }
//    
//    mutating func insert(data: T) {
//        if self.heap.count <= 1 {
//            self.heap.removeAll()
//            self.heap.append(data)
//            self.heap.append(data)
//            // 데이터가 없을 경우 Heap 배열에 데이터를 추가하고 종료
//            return
//        }
//        
//        func isMove(_ index: Int) -> Bool {
//            if index <= 1 {
//                // root node인 경우
//                return false
//            }
//            
//            let parents = index / 2
//            return self.sort(self.heap[index], self.heap[parents])
//        }
//        
//        self.heap.append(data)
//        var moveIndex = self.heap.count - 1
//        
//        while isMove(moveIndex) {
//            let parents = moveIndex / 2
//            self.heap.swapAt(moveIndex, parents)
//            moveIndex = parents
//        }
//    }
//    
//    enum moveCase {
//        case left
//        case right
//        case stop
//    }
//    mutating func pop() -> T? {
//        if self.heap.count <= 1 {
//            return nil
//        }
//        
//        func isMove(_ index: Int) -> moveCase {
//            let leftIndex = index * 2
//            let rightIndex = leftIndex + 1
//            
//            // left node가 없을 때
//            if leftIndex >= self.heap.count {
//                return .stop
//            }
//            
//            // right는 없고 left만 있을 때
//            if rightIndex >= self.heap.count {
//                return self.sort(self.heap[leftIndex], self.heap[index]) ? .left : .stop
//            }
//            
//            // root node가 값이 클 때
//            if (self.sort(self.heap[index], self.heap[leftIndex])) && (self.sort(self.heap[index], self.heap[rightIndex])) {
//                return .stop
//            }
//            
//            // root node 값보다 left, right가 둘 다 클 때
//            if (self.sort(self.heap[index], self.heap[leftIndex])) && (self.sort(self.heap[index], self.heap[rightIndex])) {
//                if self.sort(self.heap[leftIndex], self.heap[rightIndex]) {
//                    return .left
//                } else {
//                    return .right
//                }
//            }
//            
//            // 이외
//            if self.sort(self.heap[leftIndex], self.heap[rightIndex]){
//                return .left
//            } else {
//                return .right
//            }
//        }
//        
//        self.heap.swapAt(1, self.heap.count - 1)
//        let rootNode = self.heap.removeLast()
//        var moveIndex = 1
//        
//        while true {
//            switch isMove(moveIndex) {
//            case .left:
//                let nextIndex = moveIndex * 2
//                self.heap.swapAt(moveIndex, nextIndex)
//                moveIndex = nextIndex
//            case .right:
//                let nextIndex = (moveIndex * 2) + 1
//                self.heap.swapAt(moveIndex, nextIndex)
//                moveIndex = nextIndex
//            case .stop:
//                return rootNode
//            }
//        }
//    }
//    
//    func showHeap() -> [T] {
//        return Array(self.heap[1 ..< self.heap.count])
//    }
//}
//
//var maxHeap = Heap<Int>(sort: >)
//
//maxHeap.insert(data: 1)
//maxHeap.insert(data: 15)
//maxHeap.insert(data: 100)
//maxHeap.insert(data: 50)
//print(maxHeap.showHeap())
//
//maxHeap.pop()
//print(maxHeap.showHeap())
//
//maxHeap.pop()
//print(maxHeap.showHeap())
//
//maxHeap.pop()
//print(maxHeap.showHeap())
//
//maxHeap.pop()
//print(maxHeap.showHeap())
//
//maxHeap.insert(data: 7)
//print(maxHeap.showHeap())
//
//print("------------------------")
//
//var minHeap = Heap<Int>(sort: <)
//
//minHeap.insert(data: 1)
//minHeap.insert(data: 15)
//minHeap.insert(data: 100)
//minHeap.insert(data: 50)
//print(minHeap.showHeap())
//
//minHeap.pop()
//print(minHeap.showHeap())
//
//minHeap.pop()
//print(minHeap.showHeap())
//
//minHeap.pop()
//print(minHeap.showHeap())
//
//minHeap.pop()
//print(minHeap.showHeap())
//
//minHeap.insert(data: 7)
//print(minHeap.showHeap())
//
//// Heap 자료구조는 Comparable를 준수하고 있기 때문에 사용자 정의 자료형을 사용할 수 있음
//struct Custom: Comparable {
//    static func < (lhs: Custom, rhs: Custom) -> Bool {
//        // 최소힙
//        lhs.value < rhs.value
//    }
//    
//    var name: String
//    var value: Int
//}
//
//var custom = Heap<Custom>(sort: <)
//custom.insert(data: .init(name: "A", value: 1))
//custom.insert(data: .init(name: "B", value: 20))
//custom.insert(data: .init(name: "C", value: 10))
//custom.insert(data: .init(name: "D", value: 100))
//print(custom.showHeap())
//
//print("삭제", custom.pop()!)
//print(custom.showHeap())
//
//print("삭제", custom.pop()!)
//print(custom.showHeap())
//
//print("삭제", custom.pop()!)
//print(custom.showHeap())
//
//custom.insert(data: .init(name: "E", value: 0))
//print(custom.showHeap())
