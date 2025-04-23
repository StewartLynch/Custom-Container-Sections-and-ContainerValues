//
//----------------------------------------------
// Original project: CustomContainer-Demo2
// by  Stewart Lynch on 2025-04-22
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.


import SwiftUI

struct ToDoListView: View {
    @State private var allToDos = ToDo.mockToDos
    var body: some View {
        NavigationStack {
            List {
                ForEach(allToDos){ toDo in
                    HStack {
                        Button {
                            if let index = allToDos.firstIndex(where: {$0.id == toDo.id}) {
                                allToDos[index].completed.toggle()
                            }
                        } label: {
                            Image(systemName: toDo.completed ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(toDo.completed ? .green : .gray)
                        }
                        .buttonStyle(.plain)
                        Text(toDo.item)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("ToDo List")
        }
    }
}

#Preview {
    ToDoListView()
}
