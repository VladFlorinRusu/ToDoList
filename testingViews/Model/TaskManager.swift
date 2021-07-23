//
//  MyList.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/19/21.
//

import Foundation

class TaskManager {
  typealias TaskData = (activity: String, completed: Bool)
  var dataSource: [TaskData]
  static let taskManagerInstance = TaskManager()
  
  
  
  private init()
  {self.dataSource = []}
  
  
  func addNewActivity(activity act: String)
  {dataSource.append((activity: act, completed: false))
  }
  
  func deleteActivity (index i: Int)
  {dataSource.remove(at: i)
  }
  
  func toggleActivity (index i: Int)
  {if dataSource[i].completed == true
  {dataSource[i].completed = false}
  else
  {dataSource[i].completed = true}
    
  }
  
  
}


