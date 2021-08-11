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
    
    @State var showConfirmation: Bool = false
    @State var showProfileSheet: Bool = false
    
    var body: some View {
        NavigationLink(destination: ConversationView(conversation: conversation)) {
            HStack {
                Group {
                    if conversation.read {
                        Text(conversation.user.profileEmoji)
                    } else {
                        Text(conversation.user.profileEmoji)
                            .overlay(alignment: .topTrailing) {
                                Image(systemName: "circle.fill")
                                    .font(.caption2)
                                    .foregroundColor(.accentColor)
                            }
                    }
                }
                .font(.title)
                .onTapGesture {
                    showProfileSheet = true
                }
                
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
        .contextMenu {
            Button {
                conversation.read.toggle()
                hapticFeedback()
            } label: {
                conversation.readLabel
            }
            Button {
                conversation.notify.toggle()
                hapticFeedback()
            } label: {
                conversation.notifyLabel
            }
            Button(role: .destructive) {
                showConfirmation = true
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
        .swipeActions(edge: .leading) {
            Button {
                conversation.read.toggle()
                hapticFeedback()
            } label: {
                conversation.readLabel
            }
            .tint(.accentColor)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
            Button(role: .destructive) {
                showConfirmation = true
            } label: {
                Label("Delete", systemImage: "trash")
            }
            Button {
                conversation.notify.toggle()
                hapticFeedback()
            } label: {
                conversation.notifyLabel
            }
            .tint(.indigo)
        }
        .confirmationDialog("Your conversation with \(conversation.user.name) will be deleted. This action cannot be undone.", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                messagingManager.conversations.removeAll { element in
                    element.id == conversation.id
                }
            }
        }
        .sheet(isPresented: $showProfileSheet) {
            Text(conversation.user.profileEmoji)
                .font(.title)
        }
    }
    
    func hapticFeedback() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}
