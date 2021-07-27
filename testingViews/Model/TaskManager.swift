//
//  MyList.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/19/21.
//

import Foundation


protocol TaskManager {
    typealias TaskData = (activity: String, completed: Bool)
    
    func taskAt(at index: Int) -> Task
    
    func addNewActivity(activity act: String)
    
    func deleteActivity(at index: Int)
    
    func changeTask(index: Int, newTask: String)
    
    func toggleActivity (index i: Int)
}

//de facut o structura sau o clasa in loc de tupla

class Task {
    var activity: String
    var completed = false
    
    init (activity: String) {
        self.activity = activity
    }
}

class TaskManagerImpl: TaskManager {
    private var dataSource: [Task]
    static let taskManagerInstance = TaskManagerImpl()
    var numberOfTasks: Int {
        return dataSource.count
    }

    private init(){
        self.dataSource = []
    }
    
    func showActivities() {
        for i in dataSource {
            print(i.activity)
        }
    }
    
    func taskAt(at index: Int) -> Task {
        return dataSource[index]
    }
    
    func addNewActivity(activity act: String) {
        dataSource.append(Task(activity: act))
    }

    func deleteActivity (at index: Int){
        dataSource.remove(at: index)
    }
    
    func changeTask(index: Int, newTask: String){
        dataSource[index].activity = newTask
    }
    
    func toggleActivity (index i: Int) {
        if dataSource[i].completed == true {
            dataSource[i].completed = false
        }
        else{
            dataSource[i].completed = true
        }
    }


}


