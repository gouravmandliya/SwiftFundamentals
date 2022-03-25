import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


//MARK:- flatMap
// flatMap is useful when there are collections inside collections, and we want to merge them into one single collection.

let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]


let allMarks = marks.flatMap { (array) -> [Int] in
    return array
}

print(allMarks)


let valuesWithNil = [[2, nil, 5], [4, 3, nil], [nil, nil, 1]]
// Prints [3, 4, 5, 2, 5, 3, 1, 2, 2, 5, 5, 4, 3, 5, 3]
 
let flapMapresult = valuesWithNil.flatMap { $0 }

print(flapMapresult)
// Prints [Optional(2), nil, Optional(5), Optional(4), Optional(3), nil, nil, nil, Optional(1)]

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



let flatCars = peopleArray.flatMap({ $0.cars })
print("Flatmap: \(flatCars)")
