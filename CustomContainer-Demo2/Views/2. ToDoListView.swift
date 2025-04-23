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
    @State private var selectedProject: Project = .swiftUIApp
    var groupedToDos: [Project : [ToDo]] {
        Dictionary(grouping: allToDos) { $0.project }
    }
    var body: some View {
        NavigationStack {
            LabeledContent("Priority") {
                Picker("Select a Project", selection: $selectedProject) {
                    ForEach(Project.allCases) { project in
                        Text(project.displayName).tag(project)
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)
            ProjectContainerView(selectedProject: $selectedProject) {
                ForEach(Project.allCases) { project in
                    Section(project.displayName ){
                        ForEach(groupedToDos[project] ?? []){ toDo in
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
                    .containerValue(\.topPriority, project == selectedProject)
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
