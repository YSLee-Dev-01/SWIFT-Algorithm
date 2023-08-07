import Foundation

func primeNumber(_ n: Int) -> [Int] {
    var array: [Bool] = Array(repeating: true, count:  n + 1)
    array[0] = false
    array[1] = false

    var point = 2
    
    func cross(_ array: inout [Bool], point: Int) {
        for x in stride(from: point * point, to: array.count, by: point) {
            array[x] = false
        }
    }
    
    func pointChange(_ array: [Bool], _ point: Int) -> Int{
        var change = point + 1
        
        while array.count > change, !array[change] {
            change += 1
        }
        
        return change
    }
    
    while point < (Int(sqrt(Double(n))) + 1) {
        cross(&array, point: point)
        point = pointChange(array, point)
    }
    
    return array.enumerated().filter { $0.element }.map {$0.offset}
}

print(primeNumber(100))
