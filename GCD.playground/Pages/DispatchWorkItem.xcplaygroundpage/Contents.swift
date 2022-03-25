//: [Previous](@previous)

import UIKit
import PlaygroundSupport

//MARK:- DisptachWorkItem
//A dispatch work item has a cancel flag. If it is cancelled before running, the dispatch queue won’t execute it and will skip it. If it is cancelled during its execution, the cancel property return True. In that case, we can abort the execution

class SearchViewController: UIViewController, UISearchBarDelegate {
    // We keep track of the pending work item as a property
    private var pendingRequestWorkItem: DispatchWorkItem?

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Cancel the currently pending item
        pendingRequestWorkItem?.cancel()

        // Wrap our request in a work item
        let requestWorkItem = DispatchWorkItem { [weak self] in
            // call api and load data
            if self?.pendingRequestWorkItem?.isCancelled == false {
                
            }
            
        }
        // Save the new work item and execute it after 250 ms
        pendingRequestWorkItem = requestWorkItem
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2),
                                      execute: requestWorkItem)
    }
}


func dispatchWorkItemTest() {
    
    var dispatchWorkItem : DispatchWorkItem!
    
    dispatchWorkItem = DispatchWorkItem {
        for i in 0...10 {
            if dispatchWorkItem.isCancelled == false
            {
                Thread.sleep(forTimeInterval: 0.5)
                print("first \(i)")
            }
            else
            {
                print("cancelled")
                break
            }
        }
    }
    
    let queue = DispatchQueue(label: "queue",qos: .background,attributes: .concurrent)
    queue.async(execute: dispatchWorkItem)
    
    queue.asyncAfter(deadline: .now() + 2) {
        dispatchWorkItem.cancel()
    }
}



PlaygroundPage.current.needsIndefiniteExecution = true

let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)

func performAsyncTaskInConcurrentQueue() {
    var task:DispatchWorkItem?
    
    task = DispatchWorkItem {
        for i in 1...5 {
            if Thread.isMainThread {
                print("task running in main thread")
            } else{
                print("task running in other thread")
            }
            
            if (task?.isCancelled)! {
                break
            }
            
            let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imageURL)
            print("\(i) finished downloading")
        }
        task = nil
    }
    
    /*
     There are two ways to execute task on queue. Either by providing task to execute parameter or
     within async block call perform() on task. perform() executes task on current queue.
     */
    // concurrentQueue.async(execute: task!)
    
    concurrentQueue.async {
        task?.wait(wallTimeout: .now() + .seconds(2))
        // task?.wait(timeout: .now() + .seconds(2))
        task?.perform()
    }
    concurrentQueue.asyncAfter(deadline: .now() + .seconds(2), execute: {
        task?.cancel()
    })
    
    task?.notify(queue: concurrentQueue) {
        print("\n############")
        print("############")
        print("###### Work Item Completed")
    }
}

performAsyncTaskInConcurrentQueue()

print("###### Download all images asynchronously and notify on completion ######")
print("############")
print("############\n")
