//: [Previous](@previous)

import PlaygroundSupport
import Foundation

func runConcurrentGCD() {
    
    let unspecified = DispatchQueue(label: "qu")
    let utility = DispatchQueue(label: "que",attributes: .concurrent)
    
    //Sync: Blocks the caller queue until the task is done (serial or concurrent.)
    unspecified.async {
        print("Started 1")
        print("ended 1")
    }

    //Async: Does not block the caller queue.
    
    DispatchQueue.main.async {
        print("started this thread")

    }
        
    unspecified.async {
        print("Started 3")
        print("ended 3")
    }
    
    utility.async {
        print("Started 2")
        print("ended 2")
    }
    
    utility.sync {
        print("Started 4")
        print("ended 4")
        print("again ended")
    }
}

//runConcurrentGCD()


func exampleQoS() {
    let firstQueue = DispatchQueue(label: "com.app.firstQueue", qos: .userInitiated)
    let secondQueue = DispatchQueue(label: "com.app.secondQueue", qos: .unspecified)
    let thirdQueue = DispatchQueue(label: "com.app.secondQueue", qos: .default)
    secondQueue.async {
        for item in 1..<10{
            print(item)
        }
    }
    firstQueue.async {
        for item in 20..<30 {
            print(item)
        }
    }
    
    thirdQueue.async {
        for item in 50..<60 {
            print(item)
        }
    }
    
    //userInteractive
    //userInitiated
    //default
    //utility
    //background
    //unspecified

}

//exampleQoS()


func runGCD() {
    
   // let serialQueue = DispatchQueue(label: "serial.queue",attributes: .concurrent)
    let serialQueue = DispatchQueue.global(qos: .userInitiated)
    
    let utility = DispatchQueue.global(qos: .utility)
    
    print("hello world1")
    serialQueue.async {
      
        for i in 0...5 {
            print("this is some thing 1 \(i)")
            //sleep(UInt32(0.3))
        }
    }
    
    serialQueue.sync {
        print("something")
    }
  
    utility.async {
      
        for i in 0...5 {
            print("this is some thing 2 \(i)")
           // sleep(UInt32(0.2))
            
          
        }
    }
    
    print("hello world3")
    
    
    serialQueue.sync {
        print("something2")
    }
    serialQueue.sync {
      
        for i in 0...5 {
            print("this is some thing 3 \(i)")
            //sleep(UInt32(0.3))
        }
    }
}
//runGCD()

func QueueUnderStanding() {
    
    let serialQueue = DispatchQueue(label: "serialQueue")
    
    print("task not start yet")
    
    serialQueue.async {
        print("task 1 Start")
        for i in 1...5{
            print("\(i)")
        }
        print("task 1 finish")
    }
    
    serialQueue.sync {
        print("task 2 start")
        for i in 1..<3{
            print("\(i)")
        }
        print("task 2 finish")
    }
    
    serialQueue.async {
        print("task 3 start")
        for i in 5..<8{
            print("\(i)")
        }
        print("task 3 finishS")
    }
}

//QueueUnderStanding()

//dispatchWorkItemTrail()

//func say(_ text: String) {
//    print(text)
//}

//say("Hi")
//say("I love cookies")
//say("My dog is called Emma")
//say("I develop iOS apps")
//say("Goodbye")
//

func say(_ text: String, completion: @escaping () -> Void) {
    let delay = Double.random(in: 1...2)
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        print(text)
        completion()
    }
}

//say("Hi") {
//    say("I love cookies") {
//        say("My dog is called Emma") {
//            say("I develop iOS apps") {
//                say("Goodbye") {}
//            }
//        }
//    }
//}



//func saySomething(_ text:String, completion: @escaping () -> Void){
//    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//        print(text)
//        completion()
//    }
//}

//group.enter()
//say("this is"){
//    group.leave()
//}
//
//group.notify(queue: .main) {
//    print("good bye")
//}



let tere = DispatchQueue(label: "df")

tere.async {
    print("ter")
    tere.sync {
        print("ert")
    }
}
tere.async {
    print("er")
}

DispatchQueue.g
