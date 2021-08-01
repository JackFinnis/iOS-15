//
//  ConversationRow.swift
//  ConversationRow
//
//  Created by William Finnis on 01/08/2021.
//

import SwiftUI

struct ConversationRow: View {
    @EnvironmentObject var messagingManager: MessagingManager
    
    @State var conversation: Conversation
    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationLink(destination: ConversationView(conversation: conversation)) {
                HStack(spacing: 0) {
                    Image(systemName: "circle.fill")
                        .font(.caption2)
                        .foregroundColor(conversation.read ? .white : .accentColor)
                    Image(systemName: conversation.user.profilePicName)
                        .font(.title)
                    VStack(alignment: .leading) {
                        Text(conversation.user.name)
                            .font(.headline)
                        Text(conversation.messages.last!.message)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text(conversation.messages.last!.getDateString())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions(edge: .leading) {
                Button {
                    conversation.read.toggle()
                } label: {
                    conversation.readLabel
                }
                .tint(.accentColor)
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                Button(role: .destructive) {
                    messagingManager.conversations.removeAll { element in
                        element.id == conversation.id
                    }
                } label: {
                    Label("Delete", systemImage: "trash")
                }
                
                Button {
                    conversation.notify.toggle()
                } label: {
                    conversation.notifyLabel
                }
                .tint(.indigo)
            }
        }
    }
}
