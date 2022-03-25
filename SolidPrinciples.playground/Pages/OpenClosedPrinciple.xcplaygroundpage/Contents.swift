//
//  OpenClosedPrinciple.swift
//  SolidPrinciples
//
//  Created by Gourav on 08/03/22.
//

//MARK: Open/Closed principle

/* In simple term, Open for extension but closed for modification.
 Open for extension: You should be able to extend or change the behaviors of a class without efforts.
 Closed for modification: You must extend a class without changing the implementation. */


import Foundation

protocol Shape {
    func calculateArea() -> Double
}

class Rectangle:Shape {
    
    private var width: Double
    private var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func calculateArea() -> Double {
        return width * height
    }
}

class Square:Shape {
    private var side: Double
    
    init(side: Double) {
        self.side = side
    }

    func calculateArea() -> Double {
        return side * side
    }

}

class Circle:Shape {
    private var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }

    func calculateArea() -> Double {
        return .pi * radius * radius
    }

}

class AreaCalculater  {
    
    func calculateArea(shape:Shape) -> Double {
        shape.calculateArea()
    }
}


var areaCalculator = AreaCalculater()

let square = Square(side: 15)
print(areaCalculator.calculateArea(shape: square))

let rectangle = Rectangle(width: 10, height: 10)
print(areaCalculator.calculateArea(shape: rectangle))
  
let circle = Circle(radius: 20)
print(areaCalculator.calculateArea(shape: circle))
