import UIKit

var greeting = "Hello, playground"



class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}


class  Bicycle :Vehicle{
    var number = 0
    override init() {
        super.init()
        numberOfWheels = 100
    }
}

let obj = Bicycle()

obj.numberOfWheels



