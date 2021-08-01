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
                }
                .searchable(text: $messagingManager.searchText)
                .refreshable {
                    print("refreshed")
                }
                .navigationTitle("Messages")
                .toolbar {
                    Button {
                        print("new conversation")
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
                .environmentObject(messagingManager)
            }
        }
    }
}


