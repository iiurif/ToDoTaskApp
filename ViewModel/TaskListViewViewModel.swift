//
//  TaskListViewViewModel.swift
//  ToDoTaskApp
//
//  Created by User on 13/03/25.
//

import Foundation

class TaskListViewViewModel : ObservableObject {
    @Published var taskList: [TaskModel] = [
        TaskModel(title: "Task A", date: Date()),
        TaskModel(title: "Task B", date: Date()),
        TaskModel(title: "Task C", date: Date()),
        TaskModel(title: "Task D", date: Date()),
        TaskModel(title: "Task E", date: Date()),
    ]
    
    func createNewTask(name: String, date: Date) {
        let newTask = TaskModel(title: name, date: date)
        taskList.append(newTask)
    }
}
