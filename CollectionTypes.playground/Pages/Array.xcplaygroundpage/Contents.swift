
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true



//MARK:- An array stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.


var threeDoubles = Array(repeating: 0.0, count: 3)

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)


threeDoubles + anotherThreeDoubles


for (index,value) in  threeDoubles.enumerated() {
    
}



class Book:Comparable ,Equatable{
    
    var title:String
    var author:String

    init(title:String,author:String) {
        self.title = title
        self.author = author
    }
    
    static func < (lhs: Book, rhs: Book) -> Bool {
        lhs.author < rhs.author
    }
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.author == rhs.author
    }
}

private var allBooks = [Book]()

allBooks.append(Book(title: "Absalom, Absalom!", author: "John Smith"))
allBooks.append(Book(title: "A Time to Kill by John Grisham", author: "Arthur Price"))
allBooks.append(Book(title: "Vile Bodies by Evelyn Waugh", author: "Arthur Price"))
allBooks.append(Book(title: "East of Eden by John Steinbeck", author: "David Jones"))
allBooks.append(Book(title: "The Sun Also Rises by Ernest Hemingway", author: "Somebody Else"))

//let filteredBooks = allBooks.sorted(by: <)
//
//for book in filteredBooks {
//    print("Sorted books by author name \(book.author)")
//}

// Set
var movies:Set<String> = ["Avenger","Spider man"]

movies.sorted()

var anyArray : [Any] = ["string",2,0.0]
//
//print(anyArray.append(Book(title: "", author: "")))




extension Array where Element:Equatable  {
    public mutating func appendUniqueElement(_ element:Element){
        if !self.contains(element) {
            self.append(element)
        }
    }
}


var flowers = ["rose","Jasmine", "lotus"]

for item in allBooks {
    print("old \(item.title)")
}

allBooks.appendUniqueElement(Book(title: "Absalom, Absalom!", author: "John Smith"))

for item in allBooks {
    print("new \(item.title)")
}
