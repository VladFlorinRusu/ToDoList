//
//  MyList.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/19/21.
//

import Foundation


protocol TaskProtocol {
    typealias TaskData = (activity: String, completed: Bool)
    
    func selectedTask (_ index: Int) -> TaskData
    
    func numberOfTasks() -> Int
    
    func addNewActivity(activity act: String)
    
    func deleteActivity (index i: Int)
    
    func changeTask(index: Int, newTask: String)
    
    func toggleActivity (index i: Int)
}



class TaskManager: TaskProtocol{
    typealias TaskData = (activity: String, completed: Bool)
    private var dataSource: [TaskData]
    static let taskManagerInstance = TaskManager()



    private init(){
        self.dataSource = []
    }
    
    func selectedTask (_ index: Int) -> TaskData {
        return dataSource[index]
    }
    
    func numberOfTasks() -> Int {
        return dataSource.count
    }
    
    func addNewActivity(activity act: String) {
        dataSource.append((activity: act, completed: false))
    }

    func deleteActivity (index i: Int){
        dataSource.remove(at: i)
    }
    
    func changeTask(index: Int, newTask: String){
        dataSource[index].0 = newTask
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


