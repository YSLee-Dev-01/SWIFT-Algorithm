import UIKit

// array.contains()와 firstIndex, 딕셔너리의 시간 차이
func arrayContains() -> TimeInterval {
    var temp: [Int] = []
    (0 ..< Int(100000)).map {
        temp.append($0)
    }
    
    let start = Date()
    _ = temp.contains(99999)
    
    return start.timeIntervalSinceNow
}

func arrayFirstIndex() -> TimeInterval {
    var temp: [Int] = []
    (0 ..< Int(100000)).map {
        temp.append($0)
    }
    
    let start = Date()
    _ = temp.firstIndex(of: 99999)
    
    return start.timeIntervalSinceNow
}

func dictionary() -> TimeInterval{
    var temp = [Int: Int]()
    (0 ..< Int(100000)).map {
        temp[$0] = $0
    }
    
    let start = Date()
    _ = temp[99999]
    
    return start.timeIntervalSinceNow
}

print("배열, contains")
print(-arrayContains())

print("배열, firstIndex")
print(-arrayFirstIndex())

print("딕셔너리")
print(-dictionary())
