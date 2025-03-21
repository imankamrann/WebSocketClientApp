//
//  MessageData.swift
//  WebSocketClientApp
//
//  Created by Iman on 2025-03-21.
//

import Foundation

struct MessageData: Codable, Equatable {
    let type: String
    let username: String
    let message: String
    let timestamp: String
    
    static func == (lhs: MessageData, rhs: MessageData) -> Bool {
        return lhs.type == rhs.type &&
               lhs.username == rhs.username &&
               lhs.message == rhs.message &&
               lhs.timestamp == rhs.timestamp
    }
}
