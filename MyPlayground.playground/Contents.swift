import UIKit

var greeting = "Hello, playground"

//Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
// For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

func returnNumberSumBool(array:[Int],num:Int)->Bool
{
    var isNumberContain :Bool = false
    
    for numI in array
    {
        for numJ in array
        {
            if isNumberContain == false && numI != numJ
            {
               // print(numJ)
                isNumberContain = num == numJ + numI
               // print(numI+numJ)
               // print(num == numJ + numI)
            }
        }
    }
    return isNumberContain
}

returnNumberSumBool(array: [10,15,3,7,7], num: 20)



public struct Stack {
    
    private var array: [Int] = []
    
    var isEmpty:Bool {
        array.isEmpty
    }
    
    mutating func push(_ value:Int) {
        array.append(value)
    }
    
    mutating func pop() -> Int? {
        array.popLast()
    }
    
    func peek() -> Int? {
        array.last
    }
}

var obj = Stack()
obj.isEmpty
obj.push(2)
obj.push(3)
obj.pop()
obj.peek()


public struct Queue {
    
    private var list:[String] = []

    var isEmpty: Bool {
       list.isEmpty
    }
    
    mutating func enqueue(_ element: String) {
      list.append(element)
    }

    mutating func dequeue() -> String? {
       guard !isEmpty, let element = list.first else { return nil }
       list.removeAll(where: { $0 == element })
       return element
    }

    func peek() -> String? {
        list.first
    }
}

var queue = Queue()
queue.enqueue("Gaurav")
queue.enqueue("Hitesh")
if let first = queue.dequeue() {
  print(first)
}
print(queue)
queue.peek()
queue.isEmpty

let array = [1,3]
array.reduce(0, {$0 + $1})

func someEscapingClosure(completion :@escaping (_ result:Data) -> Void)
{
    completion(Data())
}


func escape(completion:@escaping () -> Void)
{
    
}



