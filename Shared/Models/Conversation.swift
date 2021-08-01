//
//  Conversation.swift
//  Conversation
//
//  Created by William Finnis on 01/08/2021.
//

import SwiftUI
import Foundation

struct Conversation: Identifiable {
    var id = UUID()
    var user: User
    var messages = [Message()]
    var read: Bool = false
    var notify: Bool = true
    
    var readLabel: some View {
        if read {
            return Label("Unread", systemImage: "eye.slash")
        } else {
            return Label("Read", systemImage: "eye")
        }
    }
    var notifyLabel: some View {
        if notify {
            return Label("Mute", systemImage: "bell.slash.fill")
        } else {
            return Label("Notify", systemImage: "bell.fill")
        }
    }
}
