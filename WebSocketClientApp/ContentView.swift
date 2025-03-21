//
//  ContentView.swift
//  WebSocketClientApp
//
//  Created by Iman on 2025-03-18.
//

import SwiftUI
import Foundation
//
//struct ContentView: View {
//    @StateObject private var webSocketManager = WebSocketManager()
//
//       struct MessageWithID: Identifiable {
//           let id = UUID()
//           let content: String
//       }
//
//       var body: some View {
//           VStack {
//               List(webSocketManager.messages.enumerated().map { MessageWithID(content: $0.element) }) { message in
//                   Text(message.content)
//                       .padding(5)
//                       .background(Color.gray.opacity(0.2))
//                       .cornerRadius(10)
//               }
//               .animation(.default, value: webSocketManager.messages)
//
//            HStack {
//                TextField("Enter message...", text: $webSocketManager.messageText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(minHeight: 30)
//                
//                Button("Send") {
//                    webSocketManager.sendMessage()
//                }
//                .buttonStyle(.borderedProminent)
//            }
//            .padding()
//
//            Button("Close Connection") {
//                webSocketManager.closeConnection()
//            }
//            .foregroundColor(.red)
//        }
//        .padding()
//    }
//}

//
//struct ContentView: View {
//    @StateObject private var webSocketManager = WebSocketManager()
//
//    struct MessageWithID: Identifiable {
//        let id = UUID()
//        let content: String
//    }
//
//    var body: some View {
//        VStack {
//            List(webSocketManager.messages.enumerated().map { MessageWithID(content: $0.element) }) { message in
//                Text(message.content)
//                    .padding(5)
//                    .background(Color.gray.opacity(0.2))
//                    .cornerRadius(10)
//            }
//            .animation(.default, value: webSocketManager.messages)
//
//            HStack {
//                TextField("Enter message...", text: $webSocketManager.messageText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(minHeight: 30)
//
//                Button("Send") {
//                    webSocketManager.sendMessage()
//                }
//                .buttonStyle(.borderedProminent)
//            }
//            .padding()
//
//            Button("Close Connection") {
//                webSocketManager.closeConnection()
//            }
//            .foregroundColor(.red)
//        }
//        .padding()
//    }
//}
//
//struct ContentView: View {
//    @StateObject private var webSocketManager = WebSocketManager()
//    @State private var usernameInput: String = ""
//    
//    struct MessageWithID: Identifiable {
//        let id = UUID()
//        let data: MessageData
//    }
//    
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Enter username", text: $usernameInput)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(maxWidth: 200)
//                
//                Button("Set Username") {
//                    webSocketManager.setUsername(usernameInput)
//                    usernameInput = ""
//                }
//                .buttonStyle(.bordered)
//            }
//            .padding(.bottom)
//            
//            List(webSocketManager.messages.enumerated().map { MessageWithID(data: $0.element) }) { message in
//                HStack(alignment: .top) {
//                    Text("\(message.data.username)")
//                        .fontWeight(.bold)
//                    Text("(\(formatTimestamp(message.data.timestamp))):")
//                        .font(.caption)
//                    Text(message.data.message)
//                    Spacer()
//                }
//                .padding(5)
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(10)
//            }
//            .animation(.default, value: webSocketManager.messages)
//            
//            HStack {
//                TextField("Enter message...", text: $webSocketManager.messageText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(minHeight: 30)
//                
//                Button("Send") {
//                    webSocketManager.sendMessage()
//                }
//                .buttonStyle(.borderedProminent)
//            }
//            .padding()
//            
//            Button("Close Connection") {
//                webSocketManager.closeConnection()
//            }
//            .foregroundColor(.red)
//        }
//        .padding()
//    }
//    
//    private func formatTimestamp(_ timestamp: String) -> String {
//        let formatter = ISO8601DateFormatter()
//        if let date = formatter.date(from: timestamp) {
//            let displayFormatter = DateFormatter()
//            displayFormatter.dateStyle = .none
//            displayFormatter.timeStyle = .medium
//            return displayFormatter.string(from: date)
//        }
//        return timestamp
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

////v3
//struct ContentView: View {
//    @StateObject private var webSocketManager = WebSocketManager()
//    @State private var usernameInput: String = ""
//    
//    struct MessageWithID: Identifiable {
//        let id = UUID()
//        let data: MessageData
//    }
//    
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Enter username", text: $usernameInput)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(maxWidth: 200)
//                
//                Button("Set Username") {
//                    webSocketManager.setUsername(usernameInput)
//                    usernameInput = ""
//                }
//                .buttonStyle(.bordered)
//            }
//            .padding(.bottom)
//            
//            List(webSocketManager.messages.enumerated().map { MessageWithID(data: $0.element) }) { message in
//                HStack(alignment: .top) {
//                    Text("\(message.data.username)")
//                        .fontWeight(.bold)
//                    Text("(\(formatTimestamp(message.data.timestamp))):")
//                        .font(.caption)
//                    Text(message.data.message)
//                    Spacer()
//                }
//                .padding(5)
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(10)
//            }
//            .animation(.default, value: webSocketManager.messages)
//            
//            HStack {
//                TextField("Enter message...", text: $webSocketManager.messageText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(minHeight: 30)
//                
//                Button("Send") {
//                    webSocketManager.sendMessage()
//                }
//                .buttonStyle(.borderedProminent)
//            }
//            .padding()
//            
//            Button("Close Connection") {
//                webSocketManager.closeConnection()
//            }
//            .foregroundColor(.red)
//        }
//        .padding()
//    }
//    
//    private func formatTimestamp(_ timestamp: String) -> String {
//        let formatter = ISO8601DateFormatter()
//        if let date = formatter.date(from: timestamp) {
//            let displayFormatter = DateFormatter()
//            displayFormatter.dateStyle = .none
//            displayFormatter.timeStyle = .medium
//            return displayFormatter.string(from: date)
//        }
//        return timestamp
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

////v4
//struct ContentView: View {
//    @StateObject private var webSocketManager = WebSocketManager()
//    @State private var usernameInput: String = ""
//    
//    struct MessageWithID: Identifiable {
//        let id = UUID()
//        let data: MessageData
//    }
//    
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Enter username", text: $usernameInput)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(maxWidth: 200)
//                
//                Button("Set Username") {
//                    webSocketManager.setUsername(usernameInput)
//                    usernameInput = ""
//                }
//                .buttonStyle(.bordered)
//            }
//            .padding(.bottom)
//            
//            List(webSocketManager.messages.enumerated().map { MessageWithID(data: $0.element) }) { message in
//                HStack(alignment: .top, spacing: 10) { // Added spacing between elements
//                    VStack(alignment: .leading, spacing: 2) { // Stack username and timestamp vertically
//                        Text("\(message.data.username)")
//                            .fontWeight(.bold)
//                            .lineLimit(1)
//                            .minimumScaleFactor(0.8)
//                        
//                        Text("(\(formatTimestamp(message.data.timestamp)))")
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                    }
//                    .frame(width: 120, alignment: .leading) // Fixed width for consistency
//                    
//                    Text(message.data.message)
//                        .frame(maxWidth: .infinity, alignment: .leading) // Let message take remaining space
//                    
//                    Spacer()
//                }
//                .padding(8) // Increased padding around the entire message
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(10)
//            }
//            .animation(.default, value: webSocketManager.messages)
//            
//            HStack {
//                TextField("Enter message...", text: $webSocketManager.messageText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(minHeight: 30)
//                
//                Button("Send") {
//                    webSocketManager.sendMessage()
//                }
//                .buttonStyle(.borderedProminent)
//            }
//            .padding()
//            
//            Button("Close Connection") {
//                webSocketManager.closeConnection()
//            }
//            .foregroundColor(.red)
//        }
//        .padding()
//    }
//    
//    private func formatTimestamp(_ timestamp: String) -> String {
//        let formatter = ISO8601DateFormatter()
//        if let date = formatter.date(from: timestamp) {
//            let displayFormatter = DateFormatter()
//            displayFormatter.dateStyle = .none
//            displayFormatter.timeStyle = .medium
//            return displayFormatter.string(from: date)
//        }
//        return timestamp
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

////v5
//import Foundation
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var webSocketManager = WebSocketManager()
//    @State private var usernameInput: String = ""
//    
//    struct MessageWithID: Identifiable {
//        let id = UUID()
//        let data: MessageData
//    }
//    
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Enter username", text: $usernameInput)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(maxWidth: 200)
//                
//                Button("Set Username") {
//                    webSocketManager.setUsername(usernameInput)
//                    usernameInput = ""
//                }
//                .buttonStyle(.bordered)
//            }
//            .padding(.bottom)
//            
//            // Replace List with ScrollView and ScrollViewReader
//            ScrollView {
//                ScrollViewReader { scrollView in
//                    VStack(spacing: 8) {
//                        ForEach(webSocketManager.messages.enumerated().map { MessageWithID(data: $0.element) }) { message in
//                            HStack(alignment: .top, spacing: 10) {
//                                VStack(alignment: .leading, spacing: 2) {
//                                    Text("\(message.data.username)")
//                                        .fontWeight(.bold)
//                                        .lineLimit(1)
//                                        .minimumScaleFactor(0.8)
//                                    
//                                    Text("(\(formatTimestamp(message.data.timestamp)))")
//                                        .font(.caption)
//                                        .foregroundColor(.gray)
//                                }
//                                .frame(width: 120, alignment: .leading)
//                                
//                                Text(message.data.message)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                
//                                Spacer()
//                            }
//                            .padding(8)
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                            .id(message.id) // Assign ID for scrolling
//                        }
//                    }
//                    .onChange(of: webSocketManager.messages) { _ in
//                        // Scroll to the last message when messages change
//                        withAnimation {
//                            scrollView.scrollTo(webSocketManager.messages.last.map { MessageWithID(data: $0) }?.id)
//                        }
//                    }
//                }
//            }
//            .frame(maxHeight: .infinity) // Ensure ScrollView takes available space
//            
//            HStack {
//                TextField("Enter message...", text: $webSocketManager.messageText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(minHeight: 30)
//                
//                Button("Send") {
//                    webSocketManager.sendMessage()
//                }
//                .buttonStyle(.borderedProminent)
//            }
//            .padding()
//            
//            Button("Close Connection") {
//                webSocketManager.closeConnection()
//            }
//            .foregroundColor(.red)
//        }
//        .padding()
//    }
//    
//    private func formatTimestamp(_ timestamp: String) -> String {
//        let formatter = ISO8601DateFormatter()
//        if let date = formatter.date(from: timestamp) {
//            let displayFormatter = DateFormatter()
//            displayFormatter.dateStyle = .none
//            displayFormatter.timeStyle = .medium
//            return displayFormatter.string(from: date)
//        }
//        return timestamp
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct ContentView: View {
    @StateObject private var webSocketManager = WebSocketManager()
    @State private var usernameInput: String = ""
    
    struct MessageWithID: Identifiable {
        let id = UUID()
        let data: MessageData
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter username", text: $usernameInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 200)
                
                Button("Set Username") {
                    webSocketManager.setUsername(usernameInput)
                    usernameInput = ""
                }
                .buttonStyle(.bordered)
            }
            .padding(.bottom)
            
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack(spacing: 8) {
                        ForEach(webSocketManager.messages.enumerated().map { MessageWithID(data: $0.element) }) { message in
                            HStack(alignment: .top, spacing: 10) {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("\(message.data.username)")
                                        .fontWeight(.bold)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.8)
                                    
                                    Text("(\(formatTimestamp(message.data.timestamp)))")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .frame(width: 120, alignment: .leading)
                                
                                Text(message.data.message)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                            }
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .id(message.id)
                        }
                    }
                    .onChange(of: webSocketManager.messages.count) { _ in
                        // Scroll to the last message when the count changes
                        withAnimation {
                            if let lastMessage = webSocketManager.messages.last {
                                scrollView.scrollTo(MessageWithID(data: lastMessage).id, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity)
            
            HStack {
                TextField("Enter message...", text: $webSocketManager.messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button("Send") {
                    webSocketManager.sendMessage()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            Button("Close Connection") {
                webSocketManager.closeConnection()
            }
            .foregroundColor(.red)
        }
        .padding()
    }
    
    private func formatTimestamp(_ timestamp: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: timestamp) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .none
            displayFormatter.timeStyle = .medium
            return displayFormatter.string(from: date)
        }
        return timestamp
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
