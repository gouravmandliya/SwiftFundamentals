import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//MARK:- Contains
//contains function is used in collections in order to check if there are elements that satisfy a certain condition and it returns a boolean value.

let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]


let hasNumbersLessThan5 = numbers.contains { (number) -> Bool in
    return number < 5
}
 
print(hasNumbersLessThan5)

class Staff {
    enum Gender {
        case male, female
    }
 
    var name: String
    var gender: Gender
    var age: Int
 
    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }
}
 
let staff = [Staff(name: "Nick", gender: .male, age: 37), Staff(name: "Julia", gender: .female, age: 29), Staff(name: "Tom", gender: .male, age: 41), Staff(name: "Tony", gender: .male, age: 45), Staff(name: "Emily", gender: .female, age: 42), Staff(name: "Irene", gender: .female, age: 30)]

let hasStaffOver40 = staff.contains { $0.age > 40 }
print("hasStaffOver40", hasStaffOver40)
// Prints true
 
let hasMalesOver40 = staff.contains { $0.gender == .male && $0.age > 40 }
print("hasMalesOver40", hasMalesOver40)
// Prints true
 
let hasMalesUnder30 = staff.contains { $0.gender == .male && $0.age < 30 }
print("hasMalesUnder30", hasMalesUnder30)

let temperatures = ["London": 7, "Athens": 14, "New York": 15, "Cairo": 19, "Sydney": 28]


let hasHighTemperatures = temperatures.contains { $0.value > 25 }
 
print(hasHighTemperatures)
// Prints true
