//
//  DependencyInversionPrinciple.swift
//  SolidPrinciples
//
//  Created by Gourav on 08/03/22.
//

//MARK: Dependency Inversion Principle

//High level modules should not depend upon low level modules. Both should depend upon abstractions.
//Abstractions should not depend upon details. Details should depend upon abstractions.

//This principle are resulted from rigorous use of those two principles (OCP and LSP)

//A bad designed code is rigid, fragile, immobile and coupled.

//If we don’t respect the DIP when developing a software, this software may become a bad designed software.

//The advantages of respecting this principle are:
//Not bad designed softwares
//Facilities in replacing peaces of software (classes, structs, modules) when they conform to protocols
//It’s easier and better when writing unit tests for structures that depends upon abstractions

import Foundation

protocol Storage {
    func save(string: String)
}

class FileSystemManager: Storage {
    func save(string: String) {
        // Open a file in read-mode
        // Save the string in this file
        // Close the file
    }
}

class DatabaseManager: Storage {
    func save(string: String) {
        // Connect to the database
        // Execute the query to save the string in a table
        // Close the connection
    }
}

class Handler {
    let storage: Storage
    // Storage types
    init(storage: Storage) {
        self.storage = storage
    }
    
    func handle(string: String) {
        storage.save(string: string)
    }
}


let handler = Handler(storage: FileSystemManager())
handler.handle(string: "one")
