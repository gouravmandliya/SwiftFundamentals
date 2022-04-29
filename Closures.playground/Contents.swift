import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    //print("Now serving \(customerProvider())!")
}

var multiply : (_ num1:Int,_ num2:Int) -> Int = { number1, number2 in
    return number1 + number2
}

print(multiply(10,45))


func asyncronousTask(id:Int,completion:@escaping(_ status:Bool)->Void){
    if id == 1 {
         completion(false)
    } else {
        completion(true)
    }
}

asyncronousTask(id: 1) { status in
    print("Status: \(status)")
}
var arr = [3,56,6]

arr.sort { num1, num2 in
    return num2 < num2
}

let newArr = arr.sorted { num1, num2 in
    num1 < num2
}

var substract :(_ num1:Int,_ num2:Int) -> Int = {
    (_ num1:Int,_ num2:Int) -> Int in
    num1 + num2
}

func getSentence(name:String) -> String {
    return "Your name is \(name)"
}

print(getSentence(name: "Gourav Mandliya"))

var getSentence: (_ name:String) -> String = {
    (name:String) -> String in
    return "Your name is \(name)"
}




