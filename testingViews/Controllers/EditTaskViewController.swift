//
//  EditTaskViewController.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/20/21.
//

import UIKit

class EditTaskViewController: UIViewController {

  @IBOutlet var taskView: TaskView!
  var selectedTask: String = ""
  var indexTask: Int = 0
  override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    taskView.textField.text = selectedTask
   configureView()
    }
    
  
  
 
    private func configureView()
    {taskView.textField.placeholder = "To Do ..."
      taskView.button.setTitle("Change Task", for: .normal)
      taskView.button.addTarget(self, action: #selector(editTask), for: .touchUpInside)
    }
  
  
  @objc func editTask()
  {
    if let changedTask = taskView.textField.text{
    TaskManager.taskManagerInstance.dataSource[indexTask].0 = changedTask
     syncTableData()
      for i in TaskManager.taskManagerInstance.dataSource
      {
        print (String(i.0))
      }
    }
    else
    {
      print("edit - failed")
    }
   // self.dismiss(animated: true, completion: nil)
    self.navigationController?.popViewController(animated: true)

  }

  private func syncTableData()
  {//obtin referinta la taskTableVC si apelez reload data pentru a sincroniza
    let i = navigationController?.viewControllers.firstIndex(of: self)
    let previousVC = navigationController?.viewControllers[i! - 1] as? TaskTableViewController
    previousVC?.tableView.reloadData()
  }
    
}
