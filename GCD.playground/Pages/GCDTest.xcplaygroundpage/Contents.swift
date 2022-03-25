import UIKit

// how wait statement working
// alternative way to use dispatch group
// print finished after activity stopped

let array:[String] = ["Async Task 1"]

func testSyncAsync() {
    let queue = DispatchQueue(label: "someQueue",attributes: .concurrent)
    queue.sync {
        print("Sync Task 1")
        queue.async {
            print("Async Task 1")
        }
        print("After Async Task 1")
    }
    print("After Sync Task 1")
}

//testSyncAsync()

//Sync Task 1
//

func dispatchGroupTest() {

    let dispatchGroup = DispatchGroup()

    let queue = DispatchQueue(label: "queue",attributes: .concurrent)

    dispatchGroup.enter()
    
    queue.async {
        for _ in 0..<10 {
            print("activity started")
            //Thread.sleep(forTimeInterval: 0.5)
        }
        dispatchGroup.leave()
    }
    
    dispatchGroup.wait(timeout: .now() + 3)
    
    dispatchGroup.enter()
    
    queue.async {
        for _ in 0..<10 {
            print("statement in between")
        }
        dispatchGroup.leave()
    }
   
    dispatchGroup.notify(qos: .userInitiated, flags: .barrier, queue: .main) {
        print("activity stopped")
    }

}


//dispatchGroupTest()

func dispatachWorkItem(){
    let firstWorkItem:DispatchWorkItem?
    let serialQueue = DispatchQueue.init(label: "serial.queue")

    firstWorkItem = DispatchWorkItem {
        let concurrentQueue = DispatchQueue.init(label: "Concurrent Queue Example", qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)

        concurrentQueue.async {
            print("activity started")
            for i in 0..<10 {
                print("\(i)")
                Thread.sleep(forTimeInterval: 0.3)
            }
        }
        
        concurrentQueue.async {
            print("activity started again")
        }
    }

    serialQueue.sync(execute: firstWorkItem!)
    let secondWorkItem:DispatchWorkItem?
    secondWorkItem = DispatchWorkItem {
        serialQueue.async {
            print("activity stopped")
        }
    }
    firstWorkItem?.notify(queue: .main, execute: secondWorkItem!)
}

//dispatachWorkItem()

func dispatchBarrier() {
    
    let concurrentQueue = DispatchQueue.init(label: "concurrent.queue",attributes: .concurrent)
    
    concurrentQueue.sync {
        print("activity started")
        for i in 0..<10 {
            print("activity started \(i)")
            Thread.sleep(forTimeInterval: 0.3)
        }
    }
    
    Thread.sleep(forTimeInterval: 2)
    
    concurrentQueue.async {
        print("activity started again")
        for i in 0..<10 {
            print("activity started again \(i)")
            Thread.sleep(forTimeInterval: 0.3)
        }
    }
    
    concurrentQueue.async(flags:.barrier) {
        print("activity stopped")
    }
}

//disptachBarrier()


func dispatchSemaphore() {
    
    let semaphore = DispatchSemaphore(value: 2)
    
    let concurrentQueue = DispatchQueue.init(label: "Concurrent Queue Example",attributes: .concurrent)
    
    semaphore.wait()
    concurrentQueue.sync {
        print("activity started")
        for i in 0..<10 {
            print("activity started \(i)")
            Thread.sleep(forTimeInterval: 0.3)
        }
        semaphore.signal()
    }
    
    Thread.sleep(forTimeInterval: 2)
    
    semaphore.wait()
    concurrentQueue.async {
        print("activity started again")
        for i in 0..<10 {
            print("activity started again \(i)")
            Thread.sleep(forTimeInterval: 0.3)
        }
        semaphore.signal()
    }
    
    concurrentQueue.async(flags:.barrier) {
        print("activity stopped")
    }
}

dispatchSemaphore()
