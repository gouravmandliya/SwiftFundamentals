import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


//MARK:- CompactMap
// CompactMap function is pretty much similar to map, with a great difference though; the resulting array does not contain any nil values.


let numbersWithNil = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]

//let doubledNums = numbersWithNil.map { (number) -> Int? in
//    if let num = number  {
//        return num * 2
//    }
//    return 0
//}

let nonNilArray = numbersWithNil.compactMap({$0}).map { num in
    return num * 2
}
print("non nil values \(nonNilArray)")
