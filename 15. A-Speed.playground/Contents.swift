import UIKit

// array.contains()와 firstIndex, filter, 딕셔너리, Set.Contains()의 시간 차이
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

func arrayFilter() -> TimeInterval{
    var temp: [Int] = []
    (0 ..< Int(100000)).map {
        temp.append($0)
    }
    
    let start = Date()
    _ = temp.filter { $0 == 99999 }
    
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

func setContains() -> TimeInterval {
    var temp = Set<Int>()
    (0 ..< Int(100000)).map {
        temp.insert($0)
    }
    
    let start = Date()
    _ = temp.contains(99999)
    
    return start.timeIntervalSinceNow
}

print("배열, contains")
print(-arrayContains())

print("배열, firstIndex")
print(-arrayFirstIndex())

print("배열, filter")
print(-arrayFilter())

print("딕셔너리, 접근")
print(-dictionary())

print("Set, contains")
print(-setContains())
