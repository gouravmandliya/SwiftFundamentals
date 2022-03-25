
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//https://www.raywenderlich.com/1172-collection-data-structures-in-swift#toc-anchor-004

//MARK:- A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items isn’t important, or when you need to ensure that an item only appears once.


var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]



//MARK:- Fundamental Set Operations

//MARK:-  Use the union(_:) method to create a new set with all of the values in both sets.
oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

//MARK:-  Use the intersection(_:) method to create a new set with only the values common to both sets.
oddDigits.intersection(evenDigits).sorted()
// []

//MARK:-  Use the subtracting(_:) method to create a new set with values not in the specified set.
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]

//MARK:-  Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]



//MARK:- Set Membership and Equality

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

//MARK:-  Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
houseAnimals == farmAnimals


//MARK:-  Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
houseAnimals.isSubset(of: farmAnimals)


//MARK:-  Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
farmAnimals.isSuperset(of: houseAnimals)


//MARK:-  Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
houseAnimals.isStrictSubset(of: farmAnimals)


//MARK:-  Use the isDisjoint(with:) method to determine whether two sets have no values in common.
houseAnimals.isDisjoint(with: farmAnimals)



struct Contacts:Hashable,Equatable {
    var name:String
    var number : String
    
    static func ==(lhs: Contacts, rhs: Contacts) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

let contacts = ["John", "Paul", "George", "Ringo", "Mick", "Keith", "Charlie", "Ronnie"]
var stringSet = Set<Contacts>() // 1

for name in contacts {
    stringSet.insert(Contacts(name: name, number: "12345"))
}

for contact in stringSet {
    print("contact names before update :\(contact)")
}

stringSet.insert(Contacts(name: "John1", number: "123"))

// 7

print("===================")
//print("Set contents: " + stringSet.description)

for contact in stringSet {
    print("contact names after update :\(contact)")
}


