//: [Previous](@previous)

import Foundation


protocol Shape {
    func area()->Double
}


class CalculateArea {
    
    func calculateArea(shape:Shape)->Double{
        shape.area()
    }
}

class Circle :Shape {

    var radius :Double = 0.0
    
    init(radius:Double) {
        self.radius = radius
    }
    
    func area()->Double {
        return .pi * radius * radius
    }
}


let circle = Circle(radius: 11)
let area = CalculateArea()

let circleArea = area.calculateArea(shape: circle)
print(circleArea)
