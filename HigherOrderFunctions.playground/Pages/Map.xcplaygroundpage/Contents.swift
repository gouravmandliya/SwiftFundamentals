import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


//MARK:- MAP
//This function performs an operation on all the elements of a collection and returns a new collection with the results of the operation on the original elements.

//MARK:- Basic Example

var numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

let newArray = numbers.map { num in
    num * 2
}

print(newArray)

//Map And Dictionaries

var info = [String: String]()
info["name"] = "andrew"
info["city"] = "berlin"
info["job"] = "developer"
info["hobby"] = "computer games"



let keys = info.map { $0.key }
let values = info.map { $0.value }

let result = info.map { $0.value.capitalized }
print(result)


class Tester {
    var name: String
    var age: Int
 
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let testers = [Tester(name: "John", age: 23), Tester(name: "Lucy", age: 25), Tester(name: "Tom", age: 32), Tester(name: "Mike", age: 29), Tester(name: "Hellen", age: 19), Tester(name: "Jim", age: 35)]


let ages = testers.map { $0.age }
print(ages)

//MARK:- Real World Example


struct Person {
    let name: String
    let address: String
    let age: Int
    let income: Double
    let cars: [String]
}

let peopleArray = [ Person(name:"Gourav", address: "Pune, India", age:34, income: 100000.0, cars:["i20","Swift","Scorpio"]),
             Person(name: "John", address:"New York, US", age: 23, income: 150000.0, cars:["Crita", "Swift"]),
             Person(name:"Amit", address:"Nagpur, India", age:17, income: 200000.0, cars:Array())]


let names = peopleArray.map({ (person) -> String in
    return person.name
})
print(names)
