//
//  ListTaskView.swift
//  ToDoTaskApp
//
//  Created by User on 13/03/25.
//

import SwiftUI

struct ListTaskView: View {
    
    @EnvironmentObject var vm : TaskListViewViewModel
    @State private var addTask : Bool = false
    
    var body: some View {
        List {
            Section {
                Button {
                    addTask.toggle()
                } label: {
                    Label {
                        Text("Add Task")
                    } icon: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            Section("Lista tarefas") {
                taskListSection
                    .listStyle(.plain)
            }
        }
        .sheet(isPresented: $addTask) {
            AddTaskView()
        }
    }
    
    private var taskListSection : some View {
        VStack {
            ScrollView {
                ForEach(vm.taskList) { task in
                    TaskView(task: task)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    ListTaskView()
}
