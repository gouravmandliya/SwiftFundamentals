import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


//MARK:- RemoveAll
//Similar to contains is the removeAll method which is pretty handy when it’s necessary to remove collection elements based on conditions that regard the actual element values.

var numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

numbers.removeAll { (number) -> Bool in
    return number < 10
}

print(numbers)
