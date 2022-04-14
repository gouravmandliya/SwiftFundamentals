import UIKit

//MARK:- CLASSES:
//Classes can be compared to a real-world group to which certain items or objects or living beings belong and each of these has similar kinds of properties as present in the group. Eg — Think of Person as a group or class. Every Person is it, a man or woman has properties and attributes which are common to both.

class Person {
    
 // Your Personal attributes and abilities can be defined here.
// Don't write if u are a vampire ;]
}


//MARK:- OBJECTS:
//An object is anything that you see which comes from a particular class. Eg — Dog, Cat, Pen, Pencil, etc, everything is an object. From our Person example, men and women are examples of objects which belong to the same class i.e Person.

let man = Person() // we created an object of Person


//MARK:- PROPERTIES:
//Technically, properties of a class are common attributes of that class that can be shared across each object which is derived from it.

class Person1 {
    
//1
    var age: Int! // These are some of the properties of Person class
    var gender: String!
    var color: String!
    var maritialStatus: String!
    
//2
    init(age: Int, gender: String, color: String, maritialStatus: String) {
    }
}


//MARK:- METHODS:
//Methods or Functions are the behavior of the objects of a class. Let us say a person can walk, sing, play, etc irrespective of any object(Man/Woman). These all can be said to be methods/functions of the class.

func play(sport: String) {
        //Write down how you will make your person instance play.
 }


//MARK:- ENCAPSULATION:
//Encapsulation is a concept by which we hide data and methods from outside intervention and usage.

class Maths {//1
    
//2
    let a: Int!
    let b: Int!
    private var result: Int?
    
//3
    init(a: Int,b: Int) {
        self.a = a
        self.b = b
    }
    
//4
    func add() {
        result = a + b
    }
    
//5
    func displayResult() {
        print("Result - \(result)")
    }
}
let calculation = Maths(a: 2, b: 3)
calculation.add()
calculation.displayResult()


//MARK:-ABSTRACTION:
//Abstraction is an OOP concept by which we expose relevant data and methods of an object hiding its internal implementation.
//In our example in encapsulation, we are exposing displayTotal() and add() method to the user to perform the calculations, but hiding the internal calculations.

//MARK:-INHERITANCE:
//Inheritance is defined as a process by which you inherit the properties of your parent. Technically, Inheritance is a process by which a child class inherits the properties of its parent class.

class Men: Person1 {//1
}
//2
let andy = Men(age: 2, gender: "M", color: "White", maritialStatus: "M")
print(andy.age) // prints 2


//MARK:-METHOD OVERLOADING:
//Method overloading is the process by which a class has two or more methods with the same name but different parameters.


//MARK:-METHOD OVERRIDING:
//Overriding is the process by which two methods have the same method name and parameters. One of the methods is in the parent class and the other is in the child class.

//MARK:-POLYMORPHISM:
//One of the important aspects of OOP which makes it a hero is the behavior of objects. Objects of the same class can behave independently within the same interface.

class Player {
  let name: String
  init(name: String) {
    self.name = name
  }
  func play() { }
}
class Batsman: Player {
  override func play() {
    bat()
  }
  private func bat() {
    print("\(name) is batting 🏏")
  }
}
class Bowler: Player {
  override func play() {
    bowl()
  }
  private func bowl() {
    print("\(name) is bowling 🏏")
  }
}
class CricketTeam {
  let name: String
  let team: [Player]
  init(name: String, team: [Player]) {
    self.name = name
    self.team = team
  }
  func play() {
    team.forEach { $0.play() }
  }
}
let rohitSharma = Batsman(name: "Rohit Sharma")
let bumrah = Bowler(name: "Jasprit Bumrah")
let indianTeam = CricketTeam(name: "India", team: [rohitSharma, bumrah])
indianTeam.play()
