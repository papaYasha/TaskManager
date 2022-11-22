import Foundation
import CoreData
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
    
    // MARK: New Task Properties
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Yellow"
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
    @Published var showDatePicker: Bool = false
    
    // MARK: Editing Existing Task Data
    @Published var editTask: Task?
    
    // MARK: Adding Task To CoreData
    func addTask(context: NSManagedObjectContext) -> Bool {
        // MARK: Updationg Existing Data in CoreData
        var task: Task!
        if let editTask = editTask {
            task = editTask
        } else {
            task = Task(context: context)
        }
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.isCompleted = false
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    // MARK: Resseting Data
    func resetTaskData() {
        taskType = "Basic"
        taskColor = "Yellow"
        taskTitle = ""
        taskDeadline = Date()
    }
    
    // MARK: Setting Exisiting Data
    /// If edit task is available then setting existing data. Edit task.
    func setupTask() {
        if let editTask = editTask {
            taskType = editTask.type ?? "Basic"
            taskColor = editTask.color ?? "Yellow"
            taskTitle = editTask.title ?? ""
            taskDeadline = editTask.deadline ?? Date()
        }
    }
}
