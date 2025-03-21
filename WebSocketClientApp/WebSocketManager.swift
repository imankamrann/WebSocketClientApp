
////v2 WORKING
import Foundation
import SwiftUI
//
//class WebSocketManager: ObservableObject {
//    @Published var messages: [String] = []
//    @Published var messageText: String = ""
//
//    private var webSocketTask: URLSessionWebSocketTask?
//    private let serverURL = "ws://localhost:8080"
//
//    init() {
//        connectToWebSocket()
//    }
//
//    func connectToWebSocket() {
//        guard let url = URL(string: serverURL) else { return }
//        let session = URLSession(configuration: .default)
//        webSocketTask = session.webSocketTask(with: url)
//        webSocketTask?.resume()
//        receiveMessage()
//    }
//
//    func sendMessage() {
//        guard !messageText.isEmpty else { return }
//        let message = URLSessionWebSocketTask.Message.string(messageText)
//
//        webSocketTask?.send(message) { error in
//            if let error = error {
//                print("Error sending message: \(error)")
//            } else {
//                DispatchQueue.main.async {
//                    self.messages.append("Me: \(self.messageText)")
//                    self.messageText = ""
//                }
//            }
//        }
//    }
//
//    func receiveMessage() {
//        webSocketTask?.receive { [weak self] result in
//            guard let self = self else { return }
//
//            switch result {
//            case .failure(let error):
//                print("Error receiving message: \(error)")
//                self.reconnect()
//
//            case .success(let message):
//                DispatchQueue.main.async {
//                    switch message {
//                    case .string(let text):
//                        print("Received: \(text)")
//                        self.messages.append("Other: \(text)")
//                    case .data(let data):
//                        print("Received binary data: \(data)")
//                    @unknown default:
//                        break
//                    }
//                    print(self.messages) // Verify messages being added
//                }
//                self.receiveMessage()
//            }
//        }
//    }
//
//    func closeConnection() {
//        webSocketTask?.cancel(with: .normalClosure, reason: nil)
//        print("WebSocket connection closed")
//    }
//
//    func reconnect() {
//        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
//            print("Reconnecting...")
//            self.connectToWebSocket()
//        }
//    }
//}


//// v2
//class WebSocketManager: ObservableObject {
//    @Published var messages: [MessageData] = []
//    @Published var messageText: String = ""
//    @Published var username: String = "Anonymous"
//    
//    private var webSocketTask: URLSessionWebSocketTask?
//    private let serverURL = "ws://localhost:8080"
//    
//    init() {
//        connectToWebSocket()
//    }
//    
//    func connectToWebSocket() {
//        guard let url = URL(string: serverURL) else { return }
//        let session = URLSession(configuration: .default)
//        webSocketTask = session.webSocketTask(with: url)
//        webSocketTask?.resume()
//        receiveMessage()
//    }
//    
//    func setUsername(_ newUsername: String) {
//        guard !newUsername.trimmingCharacters(in: .whitespaces).isEmpty else { return }
//        username = newUsername
//        let usernameMessage = MessageData(
//            type: "setUsername",
//            username: username,
//            message: "",
//            timestamp: ISO8601DateFormatter().string(from: Date())
//        )
//        if let jsonData = try? JSONEncoder().encode(usernameMessage),
//           let jsonString = String(data: jsonData, encoding: .utf8) {
//            let message = URLSessionWebSocketTask.Message.string(jsonString)
//            webSocketTask?.send(message) { error in
//                if let error = error {
//                    print("Error sending username: \(error)")
//                }
//            }
//        }
//    }
//    
//    func sendMessage() {
//        guard !messageText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
//        let messageData = MessageData(
//            type: "message",
//            username: username,
//            message: messageText,
//            timestamp: ISO8601DateFormatter().string(from: Date())
//        )
//        
//        if let jsonData = try? JSONEncoder().encode(messageData),
//           let jsonString = String(data: jsonData, encoding: .utf8) {
//            let message = URLSessionWebSocketTask.Message.string(jsonString)
//            
//            webSocketTask?.send(message) { error in
//                if let error = error {
//                    print("Error sending message: \(error)")
//                } else {
//                    DispatchQueue.main.async {
//                        self.messages.append(messageData)
//                        self.messageText = ""
//                    }
//                }
//            }
//        }
//    }
//    
//    func receiveMessage() {
//        webSocketTask?.receive { [weak self] result in
//            guard let self = self else { return }
//            
//            switch result {
//            case .failure(let error):
//                print("Error receiving message: \(error)")
//                self.reconnect()
//                
//            case .success(let message):
//                DispatchQueue.main.async {
//                    switch message {
//                    case .string(let text):
//                        if let data = text.data(using: .utf8),
//                           let messageData = try? JSONDecoder().decode(MessageData.self, from: data) {
//                            print("Received: \(messageData.message) from \(messageData.username)")
//                            self.messages.append(messageData)
//                        }
//                    case .data(let data):
//                        print("Received binary data: \(data)")
//                    @unknown default:
//                        break
//                    }
//                }
//                self.receiveMessage()
//            }
//        }
//    }
//    
//    func closeConnection() {
//        webSocketTask?.cancel(with: .normalClosure, reason: nil)
//        print("WebSocket connection closed")
//    }
//    
//    func reconnect() {
//        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
//            print("Reconnecting...")
//            self.connectToWebSocket()
//        }
//    }
//}


////v3
//class WebSocketManager: ObservableObject {
//    @Published var messages: [MessageData] = []
//    @Published var messageText: String = ""
//    @Published var username: String = "Anonymous"
//    
//    private var webSocketTask: URLSessionWebSocketTask?
//    private let serverURL = "ws://localhost:8080"
//    
//    init() {
//        connectToWebSocket()
//    }
//    
//    func connectToWebSocket() {
//        guard let url = URL(string: serverURL) else { return }
//        let session = URLSession(configuration: .default)
//        webSocketTask = session.webSocketTask(with: url)
//        webSocketTask?.resume()
//        receiveMessage()
//        
//        // Request history on connection
//        requestMessageHistory()
//    }
//    
//    private func requestMessageHistory() {
//        let historyRequest = MessageData(
//            type: "history",
//            username: username,
//            message: "",
//            timestamp: ISO8601DateFormatter().string(from: Date())
//        )
//        if let jsonData = try? JSONEncoder().encode(historyRequest),
//           let jsonString = String(data: jsonData, encoding: .utf8) {
//            let message = URLSessionWebSocketTask.Message.string(jsonString)
//            webSocketTask?.send(message) { error in
//                if let error = error {
//                    print("Error requesting history: \(error)")
//                }
//            }
//        }
//    }
//    
//    func setUsername(_ newUsername: String) {
//        guard !newUsername.trimmingCharacters(in: .whitespaces).isEmpty else { return }
//        username = newUsername
//        let usernameMessage = MessageData(
//            type: "setUsername",
//            username: username,
//            message: "",
//            timestamp: ISO8601DateFormatter().string(from: Date())
//        )
//        if let jsonData = try? JSONEncoder().encode(usernameMessage),
//           let jsonString = String(data: jsonData, encoding: .utf8) {
//            let message = URLSessionWebSocketTask.Message.string(jsonString)
//            webSocketTask?.send(message) { error in
//                if let error = error {
//                    print("Error sending username: \(error)")
//                }
//            }
//        }
//    }
//    
//    func sendMessage() {
//        guard !messageText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
//        let messageData = MessageData(
//            type: "message",
//            username: username,
//            message: messageText,
//            timestamp: ISO8601DateFormatter().string(from: Date())
//        )
//        
//        if let jsonData = try? JSONEncoder().encode(messageData),
//           let jsonString = String(data: jsonData, encoding: .utf8) {
//            let message = URLSessionWebSocketTask.Message.string(jsonString)
//            
//            webSocketTask?.send(message) { error in
//                if let error = error {
//                    print("Error sending message: \(error)")
//                } else {
//                    DispatchQueue.main.async {
//                        self.messages.append(messageData)
//                        self.messageText = ""
//                    }
//                }
//            }
//        }
//    }
//    
//    func receiveMessage() {
//        webSocketTask?.receive { [weak self] result in
//            guard let self = self else { return }
//            
//            switch result {
//            case .failure(let error):
//                print("Error receiving message: \(error)")
//                self.reconnect()
//                
//            case .success(let message):
//                DispatchQueue.main.async {
//                    switch message {
//                    case .string(let text):
//                        if let data = text.data(using: .utf8),
//                           let messageData = try? JSONDecoder().decode(MessageData.self, from: data) {
//                            print("Received: \(messageData.message) from \(messageData.username) at \(messageData.timestamp)")
//                            // Only append if it's not a setUsername message
//                            if messageData.type != "setUsername" {
//                                self.messages.append(messageData)
//                            }
//                        }
//                    case .data(let data):
//                        print("Received binary data: \(data)")
//                    @unknown default:
//                        break
//                    }
//                }
//                self.receiveMessage()
//            }
//        }
//    }
//    
//    func closeConnection() {
//        webSocketTask?.cancel(with: .normalClosure, reason: nil)
//        print("WebSocket connection closed")
//    }
//    
//    func reconnect() {
//        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
//            print("Reconnecting...")
//            self.connectToWebSocket()
//        }
//    }
//}

//v4
class WebSocketManager: ObservableObject {
    @Published var messages: [MessageData] = []
    @Published var messageText: String = ""
    @Published var username: String = "Anonymous"
    
    private var webSocketTask: URLSessionWebSocketTask?
    private let serverURL = "ws://localhost:8080"
    
    init() {
        connectToWebSocket()
    }
    
    func connectToWebSocket() {
        guard let url = URL(string: serverURL) else { return }
        let session = URLSession(configuration: .default)
        webSocketTask = session.webSocketTask(with: url)
        webSocketTask?.resume()
        receiveMessage()
        
        requestMessageHistory()
    }
    
    private func requestMessageHistory() {
        let historyRequest = MessageData(
            type: "history",
            username: username,
            message: "",
            timestamp: ISO8601DateFormatter().string(from: Date())
        )
        if let jsonData = try? JSONEncoder().encode(historyRequest),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            let message = URLSessionWebSocketTask.Message.string(jsonString)
            webSocketTask?.send(message) { error in
                if let error = error {
                    print("Error requesting history: \(error)")
                }
            }
        }
    }
    
    func setUsername(_ newUsername: String) {
        guard !newUsername.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        username = newUsername
        let usernameMessage = MessageData(
            type: "setUsername",
            username: username,
            message: "",
            timestamp: ISO8601DateFormatter().string(from: Date())
        )
        if let jsonData = try? JSONEncoder().encode(usernameMessage),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            let message = URLSessionWebSocketTask.Message.string(jsonString)
            webSocketTask?.send(message) { error in
                if let error = error {
                    print("Error sending username: \(error)")
                }
            }
        }
    }
    
    func sendMessage() {
        guard !messageText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let messageData = MessageData(
            type: "message",
            username: username,
            message: messageText,
            timestamp: ISO8601DateFormatter().string(from: Date())
        )
        
        if let jsonData = try? JSONEncoder().encode(messageData),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            let message = URLSessionWebSocketTask.Message.string(jsonString)
            
            webSocketTask?.send(message) { error in
                if let error = error {
                    print("Error sending message: \(error)")
                } else {
                    DispatchQueue.main.async {
                        self.messageText = "" // Only clear the input, don't add to messages here
                    }
                }
            }
        }
    }
    
    func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                print("Error receiving message: \(error)")
                self.reconnect()
                
            case .success(let message):
                DispatchQueue.main.async {
                    switch message {
                    case .string(let text):
                        if let data = text.data(using: .utf8),
                           let messageData = try? JSONDecoder().decode(MessageData.self, from: data) {
                            print("Received: \(messageData.message) from \(messageData.username) at \(messageData.timestamp)")
                            if messageData.type != "setUsername" {
                                self.messages.append(messageData)
                            }
                        }
                    case .data(let data):
                        print("Received binary data: \(data)")
                    @unknown default:
                        break
                    }
                }
                self.receiveMessage()
            }
        }
    }
    
    func closeConnection() {
        webSocketTask?.cancel(with: .normalClosure, reason: nil)
        print("WebSocket connection closed")
    }
    
    func reconnect() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            print("Reconnecting...")
            self.connectToWebSocket()
        }
    }
}
