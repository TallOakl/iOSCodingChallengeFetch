//
//  ErrorManager.swift
//  Fetch iOS Coding Challenge
//
//  Created by Naomi Oakley on 7/23/24.
//

import Foundation

// shows which specific errors can be thrown when doing network calls
enum ErrorManager: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
