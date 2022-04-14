import UIKit


//MARK:- An operator is a special symbol or phrase that you use to check, change, or combine values.

//=======================================================

//MARK:- Assignment Operator

let b = 10
var a = 5

//=======================================================

//MARK:- Arithmetic Operators

1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0
9 % 4    // equals 1

//=======================================================

//MARK:- Compound Assignment Operators

var c = 1
c += 2
// c is now equal to 3

//=======================================================

//MARK:- Comparison Operators

1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 isn't equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 isn't less than or equal to 1

//=======================================================

//MARK:- Ternary Conditional Operator

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90

//=======================================================


//MARK:- Nil-Coalescing Operator

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

//=======================================================

//MARK:- Range Operators

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

//=======================================================

//MARK:- Logical Operators

//Logical NOT (!a)
//Logical AND (a && b)
//Logical OR (a || b)

//=======================================================
