//
//  User.swift
//  User
//
//  Created by William Finnis on 01/08/2021.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    var profilePicName: String = "person"
}
