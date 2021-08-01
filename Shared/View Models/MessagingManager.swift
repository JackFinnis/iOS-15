//
//  MessagingManager.swift
//  MessagingManager
//
//  Created by William Finnis on 01/08/2021.
//

import Foundation

class MessagingManager: ObservableObject {
    @Published var searchText: String = ""
    @Published var conversations: [Conversation] = [
        Conversation(user: User(name: "Andy")),
        Conversation(user: User(name: "Barbara")),
        Conversation(user: User(name: "Cara")),
        Conversation(user: User(name: "Dan")),
        Conversation(user: User(name: "Edward"))
    ]
    
    var filteredConversations: [Conversation] {
        conversations.filter { conversation in
            searchText.isEmpty ? true : conversation.user.name.contains(searchText)
        }
    }
    
    func deleteConversation(at offsets: IndexSet) {
        conversations.remove(atOffsets: offsets)
    }
    
    func moveConversation(from source: IndexSet, to destination: Int) {
        conversations.move(fromOffsets: source, toOffset: destination)
    }
}
