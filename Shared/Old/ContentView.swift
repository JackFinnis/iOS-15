//
//  ContentView.swift
//  ContentView
//
//  Created by William Finnis on 02/08/2021.
//

import SwiftUI

struct ToDo: Identifiable {
    let id = UUID()
    var name: String
    var done: Bool
}

struct ContentView: View {
    @State var searchText: String = ""
    @State var todos = [ToDo]()
    @State var filteredTodos = [ToDo]()
    
    var body: some View {
        NavigationView {
            List($filteredTodos) { $todo in
                Toggle(todo.name, isOn: $todo.done)
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) { newValue in
                filterTodos(newValue: newValue)
            }
            .task(loadTodos)
            .navigationTitle("Todo List")
            .toolbar {
                Button("Print") {
                    for todo in todos {
                        print(todo.done)
                    }
                }
            }
        }
    }
    
    func loadTodos() {
        todos = [
            ToDo(name: "Eat", done: false),
            ToDo(name: "Sleep", done: false),
            ToDo(name: "Code", done: false)
        ]
        filterTodos(newValue: searchText)
    }
    
    func filterTodos(newValue: String) {
        filteredTodos = todos.filter { todo in
            newValue.isEmpty ? true : todo.name.contains(newValue)
        }
    }
}
