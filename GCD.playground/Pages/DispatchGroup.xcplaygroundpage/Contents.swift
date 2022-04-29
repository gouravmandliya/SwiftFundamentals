//: [Previous](@previous)

import UIKit

//MARK:- Dispatch groups

//With dispatch groups we can group together multiple tasks and either wait for them to be completed or be notified once they are complete. Tasks can be asynchronous or synchronous and can even run on different queues. Dispatch groups are managed by DispatchGroup object.

let group = DispatchGroup()

//print("Hi")
//
//group.enter()
//say("I love cookies") {
//    group.leave()
//}
//
//group.enter()
//say("My dog is called Emma") {
//    group.leave()
//}
//
//group.enter()
//say("I develop iOS apps") {
//    group.leave()
//}
//
//group.notify(queue: .main) {
//    print("Goodbye")
//}
//
//
//func say(_ text:String,completion:@escaping()->Void){
//    print(text)
//    completion()
//}


let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)

func performAsyncTaskIntoConcurrentQueue(with completion: @escaping () -> ()) {
        let group = DispatchGroup()
        var images : [UIImage] = []
        for i in 1...5 {
            group.enter()
            concurrentQueue.async {
                let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
                let data = try! Data(contentsOf: imageURL)
                images.append(UIImage.init(data: data)!)
                print("###### Image \(i) Downloaded ######")
                group.leave()
            }
        }
        
        /* Either write below code or group.notify() to execute completion block
         group.wait()
         DispatchQueue.main.async {
         completion()
         }
         */
  
        group.notify(queue: DispatchQueue.main) {
            completion()
        }
}

print("###### Download all images asynchronously and notify on completion ######")
print("############")
print("############\n")

performAsyncTaskIntoConcurrentQueue(with: {
    print("\n############")
    print("############")
    print("###### All images are downloaded")
})


//MARK:- Some other use cases:
//You need to run two distinct network calls. Only after they both have returned you have the necessary data to parse the responses.
//An animation is running, parallel to a long database call. Once both of those have finished, you’d like to hide a loading spinner.
//The network API you’re using is too quick. Now you're pull to the refresh gesture doesn’t seem to be working, even though it is. The API call returns so quickly that the refresh control dismisses itself as soon as it has finished the appearance animation — which makes it like it’s not refreshing. To solve this, we can add a faux delay. i.e. we can wait for both some minimum time threshold, and the network call, before hiding the refresh control.


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
dispatchGroupTest()
