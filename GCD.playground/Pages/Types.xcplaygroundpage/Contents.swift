
import Foundation

//MARK:- Queues can be either serial or concurrent.

//MARK:- Serial queues - FIFO
//Serial queues guarantee that only one task runs at any given time. GCD controls the execution timing. You won’t know the amount of time between one task ending and the next one beginning

let serialQueue = DispatchQueue(label: "serial.queue")

serialQueue.sync {
    // perform task
}

//MARK:- Concurrentqueues
//It’s starting multiple tasks at the same time but not guarantee for the finish at same time. Its can finish any order.

let concurrentQueues = DispatchQueue(label: "concurrent.queue", attributes: .concurrent)

concurrentQueues.sync {
    // perform task
}

//MARK:- GCD provides three main types of queues:

//MARK:-Main queue:
//runs on the main thread and is a serial queue.

//MARK:- Usage
//This is a common choice to update the UI after completing work in a task on a concurrent queue. To do this, you code one closure inside another. Targeting the main queue and calling async guarantees that this new task will execute sometime after the current method finishes.

DispatchQueue.main.async {
    // perform tasks
}


//MARK:-Global queues:
//concurrent queues that are shared by the whole system. There are four such queues with different priorities : high, default, low, and background. The background priority queue has the lowest priority and is throttled in any I/O activity to minimize negative system impact.

//MARK:- Usage:
//This is a common choice to perform non-UI work in the background.
let globalQueue = DispatchQueue.global()

globalQueue.async {
    // perform tasks
}

//MARK:- The QoS classes are:

//MARK:-User-interactive:
//This represents tasks that must complete immediately in order to provide a nice user experience. Use it for UI updates, event handling and small workloads that require low latency. The total amount of work done in this class during the execution of your app should be small. This should run on the main thread.

let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)

userInteractiveQueue.async {
   //perform task
}

//MARK:-User-initiated:
//The user initiates these asynchronous tasks from the UI. Use them when the user is waiting for immediate results and for tasks required to continue user interaction. They execute in the high priority global queue.

let userInitiatedQueue = DispatchQueue.global(qos: .userInitiated)


userInitiatedQueue.async {
   //perform task
}
//MARK:-Utility:
//This represents long-running tasks, typically with a user-visible progress indicator. Use it for computations, I/O, networking, continuous data feeds and similar tasks. This class is designed to be energy efficient. This will get mapped into the low priority global queue.

let utilityQueue = DispatchQueue.global(qos: .utility)

utilityQueue.async {
   //perform task
}

//MARK:-Background:
//This represents tasks that the user is not directly aware of. Use it for prefetching, maintenance, and other tasks that don’t require user interaction and aren’t time-sensitive. This will get mapped into the background priority global queue.

let backgroundQueue = DispatchQueue.global(qos: .background)

backgroundQueue.async {
   //perform task
}

//MARK:-Custom queues:
//queues that you create which can be serial or concurrent. Requests in these queues actually end up in one of the global queues.

//MARK:- Usage:
//A good choice when you want to perform background work serially and track it. This eliminates resource contention and race conditions since you know only one task at a time is executing. Note that if you need the data from a method, you must declare another closure to retrieve it or consider using sync.


//Serial
let mySerialqueue = DispatchQueue(label: "com.max")

//Concurrent
let workerQueue = DispatchQueue(label: "com.max", qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)


//MARK:- Delaying Task Execution
//DispatchQueue allows you to delay task execution. Care should be taken not to use this to solve race conditions or other timing bugs through hacks like introducing delays. Use this when you want a task to run at a specific time.

DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
    // perform tasks
}


//MARK:-Synchronous vs. Asynchronous

//Sync : The program waits until execution finishes before the method call returns.
//Async : The method call returns immediately.


//With GCD, you can dispatch a task either synchronously or asynchronously.
//A synchronous function returns control to the caller after the task is completed.
//An asynchronous function returns immediately, ordering the task to be done but not waiting for it. Thus, an asynchronous function does not block the current thread of execution from proceeding on to the next function.



