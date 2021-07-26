//
//  AddTaskViewController.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/19/21.
//

import UIKit

class AddTaskViewController: UIViewController {
  

  @IBOutlet var taskView: TaskView!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
  }
  
  
  
  
  
  
  //MARK: - ACTIONS
  
  @objc func addTask ()
  {// nu ar trebui sa dea nicioadata fail, butonul nu apare pana nu se tasteaza ceva...
    
    if let newTask = taskView.textField.text
    {
      TaskManager.taskManagerInstance.addNewActivity(activity: newTask)
      syncTableData()
      
      for i in TaskManager.taskManagerInstance.dataSource
      {
        print(String(i.0))
      }
    }
    else
    {print("no text added")}
  }

  
  
  
//MARK: -PRIVATE FUNCTIONS

  private func syncTableData()
  {//obtin referinta la taskTableVC si apelez reload data pentru a sincroniza 
    let i = navigationController?.viewControllers.firstIndex(of: self)
    let previousVC = navigationController?.viewControllers[i! - 1] as? TaskTableViewController
    previousVC?.tableView.reloadData()
  }

  
  
  
  private func configureView()
  {taskView.textField.placeholder = "To Do ..."
    taskView.button.setTitle("Add Task", for: .normal)
    taskView.button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
  }
  
  
  
}
