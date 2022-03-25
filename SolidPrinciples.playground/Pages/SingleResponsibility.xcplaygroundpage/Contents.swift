//
//  File.swift
//  SolidPrinciples
//
//  Created by Gourav on 08/03/22.
//

//https://codeburst.io/solid-design-principle-using-swift-fa67443672b8

//MARK: Single Responsibility Principle
//It states that every module should have only one responsibility and reason to change.

import Foundation

//Wrong Way

/*
class Handler {
    
    func handle() {
        let data = requestDataToAPI()
        let array = parse(data: data)
        saveToDatabase(array: array)
    }
  
    private func requestDataToAPI() -> Data {
        // Network request and wait the response
    }
    
    private func parseResponse(data: Data) -> [String] {
        // Parse the network response into array
    }
   
    private func saveToDatabase(array: [String]) {
        // Save parsed response into database
    }
}
*/

//Correct way

class Handler {
    
    private let apiHandler: NetworkHandler
    private let parseHandler: ResponseHandler
    private let databaseHandler: DatabaseHandler
    
    init(apiHandler: NetworkHandler, parseHandler: ResponseHandler, dbHandler: DatabaseHandler) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.databaseHandler = dbHandler
    }
    
    func handle() {
        let data = apiHandler.requestDataToAPI()
        let array = parseHandler.parseResponse(data: data)
        databaseHandler.saveToDatabase(array: array)
    }
}

class NetworkHandler {
    func requestDataToAPI() -> Data {
        // Network request and wait the response
        return Data()
    }
}

class ResponseHandler {
    func parseResponse(data: Data) -> [String] {
        // Parse the network response into array
        return [String]()
    }
}

class DatabaseHandler {
    func saveToDatabase(array: [String]) {
        // Save parsed response into database
    }
}

let handler = Handler(apiHandler: NetworkHandler(), parseHandler: ResponseHandler(), dbHandler: DatabaseHandler())

handler.handle()
