//
//  FriendDetailView.swift
//  FriendDetailView
//
//  Created by William Finnis on 01/08/2021.
//

import SwiftUI

struct ConversationView: View {
    var conversation: Conversation
    
    var body: some View {
        Text("Say hi to \(conversation.user.name)!")
            .navigationTitle(conversation.user.name)
    }
}
