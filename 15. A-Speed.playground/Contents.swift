import UIKit

let data = Calendar.current.date(from: DateComponents(year: 2016, month: 05, day: 24))
Calendar.current.component(.weekday, from: data!)
// array.contains()와 딕셔너리의 시간 차이
func array() -> TimeInterval {
    var temp: [Int] = []
    (0 ..< Int(100000)).map {
        temp.append($0)
    }
    
    let start = Date()
    _ = temp.contains(99999)
    
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

print("배열")
print(-array())

print("딕셔너리")
print(-dictionary())
