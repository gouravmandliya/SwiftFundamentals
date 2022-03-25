import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


//MARK:- ForEach
//forEach calls the given closure on each element in the sequence in the same order as a for-in loop.


//MARK:- Important Note :
//Using the forEach method is distinct from a for-in loop in two important ways:

//1. You cannot use a break or continue statement to exit the current call of the body closure or skip subsequent calls.

//2. Using the return statement in the body closure will exit only from the current call to body, not from any outer scope, and won’t skip subsequent calls.

let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
 
for number in numbers {
    
    number.isMultiple(of: 2) ? print("\(number) is even") : print("\(number) is odd")
}

numbers.forEach { (number) in
    
    number.isMultiple(of: 2) ? print("\(number) is even") : print("\(number) is odd")
}
