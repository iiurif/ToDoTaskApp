//
//  AddTaskView.swift
//  ToDoTaskApp
//
//  Created by User on 13/03/25.
//

import SwiftUI

struct AddTaskView : View {
    
    @EnvironmentObject var vm : TaskListViewViewModel
    
    @Environment(\.dismiss) var dismiss
    @State var taskName : String = ""
    @State var taskDate : Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("", text: $taskName)
                DatePicker("Task date", selection: $taskDate)
            }.toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Text("Save")
                        .onTapGesture {
                            if taskName == "" && taskName.isEmpty { return }
                            vm.createNewTask(name: taskName, date: taskDate)
                            dismiss()
                            print("Save")
                        }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Text("Cancel")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    AddTaskView(taskName: "", taskDate: Date())
}
