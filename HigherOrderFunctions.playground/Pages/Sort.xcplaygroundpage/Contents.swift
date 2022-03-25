import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//MARK:- Sorted
//Sorting a collection’s data in ascending order is easy in Swift using the sorted() method.


let toSort = [5, 3, 8, 2, 10]
 
let sorted = toSort.sorted()
 
print(sorted)
// Prints [2, 3, 5, 8, 10]
