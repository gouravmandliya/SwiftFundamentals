//: [Previous](@previous)

import UIKit

//MARK:-  DispatchSemaphore
//In multithreaded programming, it’s important to make threads wait. They must wait for exclusive access to a resource. One way to make threads wait and put them to sleep inside the kernel so that they no longer take any CPU time — is with a semaphore. Semaphores were invented by Dijkstra back in the early 1960s.


import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
//let semaphore = DispatchSemaphore(value: 2)

func performAsyncTaskIntoConcurrentQueue() {
    for i in 1...6 {
        concurrentQueue.async {
            print("###### Image \(i) waiting for download ######")
            semaphore.wait()
            print("###### Downloading Image \(i) ######")
            let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imageURL)
            print("###### Image \(i) Downloaded ######")
            semaphore.signal()
        }
    }
}

//print("###### Download all images asynchronously ######")
//print("############")
//print("############\n")

//performAsyncTaskIntoConcurrentQueue()


//A memory barrier is a method to order memory access. Compilers and CPU's can change this order to optimize, but in multithreaded environments, this can be an issue. The main difference with the others is that threads are not stopped by this.
//A lock or mutex makes sure that code can only be accessed by 1 thread. Within this section, you can view the environment as singlethreaded, so memory barriers should not be needed.
//a semaphore is basically a counter that can be increased (v()) or decreased (p()). If the counter is 0, then p() halts the thread until the counter is no longer 0. This is a way to synchronize threads, but I would prefer using mutexes or condition variables (controversial, but that's my opinion). When the initial counter is 1, then the semaphore is called a binary semaphore and it is similar to a lock.
//A big difference between locks and semaphores is that the thread owns the lock, so no other thread should try to unlock, while this is not the case for semaphores.

//For example, you may want to download a lot of images in parallel but since you know that they are heavy images, you want to limit to two downloads only at a single time so you use a semaphore. You also want to be notified when all the downloads (say there are 50 of them) are done, so you use DispatchGroup. Thus, it is not a matter of choosing between the two. You may use one or both in the same implementation depending on your goals. This type of example was provided in the Concurrency tutorial on Ray Wenderlich's site:


let semaphore = DispatchSemaphore(value: 2)

let urls = ["https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_900,c_fill,g_auto,h_506,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F150601115126-01-in2white.jpg"]

var images: [UIImage] = []

for url in urls {
    guard let url = URL(string: "\(url)") else { continue }
    
    semaphore.wait()
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
        defer {
            semaphore.signal()
        }
        
        if error == nil,
           let data = data,
           let image = UIImage(data: data) {
            images.append(image)
        }
    }
    task.resume()
}


func semaphoreExample () {
    print("starting long running tasks (2 at a time)")
    let sem = DispatchSemaphore(value: 65)            //this semaphore only allows 2 tasks to run at the same time (the resource count)
    
    for i in 0...100 {                                 //launch a bunch of tasks
        DispatchQueue.global().async {               //run tasks on a background thread
            let count = sem.signal()
            //print("first signal \(count)")
            sem.wait()
            // sem.wait()
            //wait here if no resources available
            sleep(2)                                 //do some long task eg file access (here we are just sleeping for a 2 seconds for demonstration purposes)
            print("long task \(i) done! \(Date())")
            let count1 = sem.signal()
            //  print("second signal \(count1)")
        }
    }
}

semaphoreExample()

struct Example: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

enum ResponseResult {
    case success(Decodable)
    case error(Error)
}

func getDataFromServer(completion:@escaping(ResponseResult)->Void) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            if let books = try? JSONDecoder().decode([Example].self, from: data) {
                print(books)
                completion(.success(books))
            } else {
                print("Invalid Response")
            }
        } else if let error = error {
            print("HTTP Request Failed \(error)")
            completion(.error(error))
        }
    }
    task.resume()
}
getDataFromServer { result in
    switch result {
    case .success(let response):
        let res = response as! Example
        print(res.id)
    case .error(let err):
      print(err)
  }
}


