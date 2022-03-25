import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//MARK:- Reduce
// The purpose of the reduce higher order function is to produce one value from the values of all elements in a collection.

let numbersReduce = [5, 3, 8, 4, 2]

numbersReduce.reduce(0, +)

//Suppose some friends want to buy game console of their money we can check sum of money so they can buy all together the new game console that they badly want.

let friendsAndMoney = ["Alex": 150.00, "Tim": 62.50, "Alice": 79.80, "Jane": 102.00, "Bob": 94.20]

let allMoney = friendsAndMoney.reduce(0, { $0 + $1.value })

print(allMoney)


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



let totolIncome = peopleArray.reduce(0, {$0 + $1.income})
print("Total Income: \(totolIncome)")
