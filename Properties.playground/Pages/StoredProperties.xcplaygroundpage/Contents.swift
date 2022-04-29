
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//MARK:- In its simplest form, a stored property is a constant or variable that’s stored as part of an instance of a particular class or structure. Stored properties can be either variable stored properties (introduced by the var keyword) or constant stored properties (introduced by the let keyword).


//MARK:- Stored Properties of Constant Structure Instances

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8



//MARK:- Lazy Stored Properties
//A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used. You indicate a lazy stored property by writing the lazy modifier before its declaration.


struct Person {
    let name: String
    let age: Int
}

struct PeopleViewModel {
    let people: [Person]
    
    lazy var oldest: Person? = {
        print("Lazy var oldest initialized")
        return people.max(by: { $0.age < $1.age })
    }()
    
    init(people: [Person]) {
        self.people = people
        print("View model initialized")
    }
}


var viewModel = PeopleViewModel(people: [
    Person(name: "Antoine", age: 30),
    Person(name: "Jaap", age: 3),
    Person(name: "Lady", age: 3),
    Person(name: "Maaike", age: 27)
])
// Prints: "View model initialized"

print(viewModel.oldest)
// Prints: "Lazy var oldest initialized"
// Prints: Person(name: "Antoine", age: 30)
