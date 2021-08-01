//
//  FriendDetailView.swift
//  FriendDetailView
//
//  Created by William Finnis on 01/08/2021.
//

import SwiftUI

struct MessageFriendView: View {
    var friend: String
    
    var body: some View {
        Text("Say hi to \(friend)!")
            .navigationTitle(friend)
    }
}
