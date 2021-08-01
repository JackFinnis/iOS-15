//
//  ContentView.swift
//  Shared
//
//  Created by William Finnis on 01/08/2021.
//

import SwiftUI

struct MessagesView: View {
    @StateObject var messagingManager = MessagingManager()

    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                List {
                    ForEach(messagingManager.filteredConversations) { conversation in
                        ConversationRow(conversation: conversation)
                    }
                    .onDelete(perform: messagingManager.deleteConversation)
                    .onMove(perform: messagingManager.moveConversation)
                }
                .listStyle(.plain)
                .searchable(text: $messagingManager.searchText) {
                    ForEach(messagingManager.filteredConversations) { conversation in
                        Text(conversation.user.name)
                            .searchCompletion(conversation.user.name)
                    }
                }
                .refreshable {
                    messagingManager.conversations.append(Conversation(user: User(name: "Will")))
                }
                .navigationTitle("Messages")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("new conversation")
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
                .environmentObject(messagingManager)
            }
        }
    }
}


