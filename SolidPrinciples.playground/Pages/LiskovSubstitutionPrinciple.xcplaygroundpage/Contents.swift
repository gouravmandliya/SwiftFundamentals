//
//  LiskovSubstitutionPrinciple.swift
//  SolidPrinciples
//
//  Created by Gourav on 08/03/22.
//

//MARK: Liskov Substitution Principle

//Functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it.

//To avoid breaking this principle, the better recommendation is to prefer composition over inheritance for the abstractions. For sure it’s not a silver bullet, but we really believe it solves the most of cases.

//Child classes should never break the parent class type definitions

import Foundation
//
//
//class Rectangle {
//    var width: Int
//    var height: Int
//
//    init(width: Int, height: Int) {
//        self.width = width
//        self.height = height
//    }
//
//    func area() -> Int {
//        return width * height
//    }
//}
//
//class Square: Rectangle {
//    override var width: Int {
//        didSet {
//            super.height = width
//        }
//    }
//
//    override var height: Int {
//        didSet {
//            super.width = height
//        }
//    }
//}
//
//
//let square = Square(width: 10, height: 10)
//
//  let rectangle: Rectangle = square
//
//  rectangle.height = 7
//  rectangle.width = 5

//  print(rectangle.area())
  // As a rectangle we should expect the area as 7 x 5 = 35, but we got 5 x 5 = 25


//=========================

protocol Geometrics {
    func calculateArea() -> Int
}

class Rectangle: Geometrics {
    var width: Int
    var height: Int

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    func calculateArea() -> Int {
        return width * height
    }
}

class Square: Geometrics {
    var edge: Int

    init(edge: Int) {
        self.edge = edge
    }

    func calculateArea() -> Int {
        return edge * edge
    }
}

let rectangle: Geometrics = Rectangle(width: 10, height: 10)
  print(rectangle.calculateArea())

  let rectangle2: Geometrics = Square(edge: 5)
  print(rectangle2.calculateArea())
