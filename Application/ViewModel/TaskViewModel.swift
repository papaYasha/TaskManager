import Foundation
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
}
