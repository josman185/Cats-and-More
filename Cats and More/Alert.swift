//
//  Alert.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/4/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData          = AlertItem(title: Text("Server Error"),
                                       message: Text("Data from Server is not valid, please contact support."),
                                       dismissButton: .default(Text("OK"))
    )
    static let invalidResponse      = AlertItem(title: Text("Server Error"),
                                       message: Text("Invalid response, please try again later or contact support."),
                                       dismissButton: .default(Text("OK"))
    )
    static let invalidURL           = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. If persist please contact support."),
                                       dismissButton: .default(Text("OK"))
    )
    static let unableToComplete     = AlertItem(title: Text("Server Error"),
                                       message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                       dismissButton: .default(Text("OK"))
    )
    
}
