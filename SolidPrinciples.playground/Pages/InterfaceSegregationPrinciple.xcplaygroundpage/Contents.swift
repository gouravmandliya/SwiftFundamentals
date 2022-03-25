//
//  InterfaceSegregationPrinciple.swift
//  SolidPrinciples
//
//  Created by Gourav on 08/03/22.
//

//MARK: Interface Segregation Principle

//The Interface Segregation Principle states that clients should not be forced to implement interfaces they don’t use. Instead of one fat interface many small interfaces are preferred based on groups of methods, each one serving one submodule.


import Foundation

protocol Worker {
    func work()
    func eat()
}

class ManWorker: Worker {
    func work() {
        print("Man worker can work")
    }

    func eat() {
        print("Man worker can eat")
    }
}

class WomenWorker: Worker {
    func work() {
        print("Woman worker can work")
    }

    func eat() {
        print("Women worker can eat")
    }
}

//
//let man = ManWorker()
//man.work()
//man.eat()
//
//let women = WomenWorker()
//women.work()
//women.eat()
//
struct Robot: Worker {
    func work() {
        print("Robot working... efficiently")
    }

    func eat() {
        assert(false, "Dont force me to eat, or i will crash")
    }
}
//
//
//let robot = Robot()
//robot.work()


protocol Workable {
    func work()
}

protocol Feedable {
    func eat()
}

struct ManWorker: Feedable, Workable {
    func work() {
        print("Man Worker working...")
    }
    
    func eat() {
        print("Man Worker eating...")
    }
}

struct WomanWorker: Feedable, Workable {
    func work() {
        print("Woman Worker working...")
    }
    
    func eat() {
        print("Woman Worker eating...")
    }
}

struct Robot: Workable {
    func work() {
        print("Robot working...")
    }
}

let man = ManWorker()
man.work()
man.eat()

let women = WomanWorker()
women.work()
women.eat()

let robot = Robot()
robot.work()


//===========================


////We start with the protocol GestureProtocol with a method didTap:
////protocol GestureProtocol {
////    func didTap()
////}
//
////After some time, you have to add new gestures to the protocol and it becomes:
//protocol GestureProtocol {
//    func didTap()
//    func didDoubleTap()
//    func didLongPress()
//}
//
//class SuperButton: GestureProtocol {
//    func didTap() {
//        // send tap action
//    }
//
//    func didDoubleTap() {
//        // send double tap action
//    }
//
//    func didLongPress() {
//        // send long press action
//    }
//}
//
//class PoorButton: GestureProtocol {
//    func didTap() {
//        // send tap action
//    }
//
//    func didDoubleTap() { }
//
//    func didLongPress() { }
//}





protocol TapProtocol {
    func didTap()
}
 
protocol DoubleTapProtocol {
    func didDoubleTap()
}
 
protocol LongPressProtocol {
    func didLongPress()
}
 
class SuperButton: TapProtocol, DoubleTapProtocol, LongPressProtocol {
    func didTap() {
        // send tap action
    }
 
    func didDoubleTap() {
        // send double tap action
    }
 
    func didLongPress() {
        // send long press action
    }
}
 
class PoorButton: TapProtocol {
    func didTap() {
        // send tap action
    }
}
