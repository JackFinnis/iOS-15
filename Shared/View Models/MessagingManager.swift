//
//  MessagingManager.swift
//  MessagingManager
//
//  Created by William Finnis on 01/08/2021.
//

import Foundation

@MainActor
class MessagingManager: ObservableObject {
    @Published var searchText: String = ""
    @Published var conversations: [Conversation] = [] {
        didSet {
            for conversation in conversations {
                print(conversation.read)
            }
        }
    }
    
    var filteredConversations: [Conversation] {
        conversations.filter { conversation in
            searchText.isEmpty ? true : conversation.user.name.contains(searchText)
        }
    }
    
    func getConversations() {
        self.conversations = [
            Conversation(user: User(name: "Andy")),
            Conversation(user: User(name: "Barbara")),
            Conversation(user: User(name: "Cara")),
            Conversation(user: User(name: "Dan")),
            Conversation(user: User(name: "Edward"))
        ]
    }
}
