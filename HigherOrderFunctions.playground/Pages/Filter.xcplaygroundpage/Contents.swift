import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


//MARK:- Filter
// filter higher order function is one of the most useful among all and it can be proved a great tool when used. As its name suggests, its purpose is to filter the elements of a collection based on a condition and produce a new one containing only those elements that satisfy the condition.


let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

let over10 = numbers.filter { (number) -> Bool in
    return number > 10
}

print(over10)
//[15, 12, 17, 20, 11]

class Tester {
    var name: String
    var age: Int
 
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let testers = [Tester(name: "John", age: 23), Tester(name: "Lucy", age: 25), Tester(name: "Tom", age: 32), Tester(name: "Mike", age: 29), Tester(name: "Hellen", age: 19), Tester(name: "Jim", age: 35)]


let filteredTesters = testers.filter { $0.name.prefix(1) == "J" && $0.age >= 30 }


print(filteredTesters[0].name, filteredTesters[0].age)
//Jim 35
