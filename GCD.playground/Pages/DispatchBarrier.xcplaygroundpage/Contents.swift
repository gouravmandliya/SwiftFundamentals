//: [Previous](@previous)

import Foundation
import PlaygroundSupport

//MARK:- Dispatch Barrier
//Use a barrier to synchronize the execution of one or more tasks in your dispatch queue. When you add a barrier to a concurrent dispatch queue, the queue delays the execution of the barrier block (and any tasks submitted after the barrier) until all previously submitted tasks finish executing. After the previous tasks finish executing, the queue executes the barrier block by itself. Once the barrier block finishes, the queue resumes its normal execution behavior.

PlaygroundPage.current.needsIndefiniteExecution = true


//var value: Int = 2
//
//let concurrentQueue = DispatchQueue(label: "queue", attributes: .concurrent)
//
//concurrentQueue.async {
//    for i in 0...3 {
//        value = i
//        print("\(value) ✴️")
//    }
//}
//
//concurrentQueue.async {
//    for j in 4...6 {
//        value = j
//        print("\(value) ✡️")
//    }
//}
//
//concurrentQueue.async {
//    value = 9
//    print(value)
//}
//
//concurrentQueue.async {
//    value = 14
//    print(value)
//}


var value: Int = 2

let concurrentQueue = DispatchQueue(label: "queue", attributes: .concurrent)

concurrentQueue.async(flags: .barrier) {
    for i in 0...3 {
        value = i
        print("\(value) ✴️")
    }
}

concurrentQueue.async {
    print(value)
}

concurrentQueue.async(flags: .barrier) {
    for j in 4...6 {
        value = j
        print("\(value) ✡️")
    }
}

concurrentQueue.async {
    value = 14
    print(value)

}
