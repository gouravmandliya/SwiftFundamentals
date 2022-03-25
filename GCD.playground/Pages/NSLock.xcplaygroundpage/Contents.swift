//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//MARK:- NSLOCK
//An NSLock is a mutex; it prevents multiple threads from accessing the same resource simultaneously, which is exactly what you want to do here. Once one thread acquires the lock, other threads attempting to acquire the lock will wait until the first thread releases the lock.

var accountBalance = 5000

var lock = NSLock()

var semaphore = DispatchSemaphore(value: 1)

struct Bank {
    
    let withdrawMethod :String
    
    func doTransaction(amount:Int) {
        
        lock.lock()
       // semaphore.wait()
        if accountBalance > amount {
           
            print("\(self.withdrawMethod) payment is suffienct,transaction is processing..")
            
            Thread.sleep(forTimeInterval: Double.random(in: 0...4))
            
            accountBalance -= amount
            print("\(self.withdrawMethod) payment done")
            print("\(self.withdrawMethod) current balance : \(accountBalance)")
            
        } else {
            print("\(withdrawMethod) can't do transaction, insufficent balance")
        }
        lock.unlock()
        //semaphore.signal()
    }
}

let queue = DispatchQueue(label: "withdrawalQueue",attributes: .concurrent)

queue.async {
    let bankWithdrawal = Bank(withdrawMethod: "Bank Withdrawal")
    bankWithdrawal.doTransaction(amount: 3000)
}

queue.async {
    let atmWithdrawal = Bank(withdrawMethod: "Atm Withdrawal")
    atmWithdrawal.doTransaction(amount: 4000)
}
