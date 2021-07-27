//
//  AddTaskViewController.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/19/21.
//

import UIKit

class AddEditTaskViewController: UIViewController {
  

    @IBOutlet var taskView: TaskView!
    var selectedTask: String = ""
    var indexTask: Int = 0
  
  // MARK: - LIFECYCLE
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        configureView()
    }
  
  //MARK: - ACTIONS
  
    @objc func addTask ()
    {// nu ar trebui sa dea nicioadata fail, butonul nu apare pana nu se tasteaza ceva...

        if let newTask = taskView.textField.text {
            TaskManager.taskManagerInstance.addNewActivity(activity: newTask)
            syncTableData()
            self.navigationController?.popViewController(animated: true)
           
        }
        else {
            print("no text added")
        }
    }
  
    @objc func editTask() {
        if let changedTask = taskView.textField.text{
            TaskManager.taskManagerInstance.changeTask(index: indexTask, newTask: changedTask)
            syncTableData()
        }
        else {
            print("edit - failed")
        }
        self.navigationController?.popViewController(animated: true)
    }
  
//MARK: - PRIVATE FUNCTIONS

    private func syncTableData() {//obtin referinta la taskTableVC si apelez reload data pentru a sincroniza
        let i = navigationController?.viewControllers.firstIndex(of: self)
        let previousVC = navigationController?.viewControllers[i! - 1] as? TaskTableViewController
        previousVC?.tableView.reloadData()
    }

    private func configureView() {
        if selectedTask == "" {
            self.title = "Add a new Task"
            taskView.textField.placeholder = "To Do ..."
            taskView.button.setTitle("Add Task", for: .normal)
            taskView.button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        }
        else {
            self.title = "Edit Task"
            taskView.textField.text = selectedTask
            taskView.button.setTitle("Change Task", for: .normal)
            taskView.button.addTarget(self, action: #selector(editTask), for: .touchUpInside)
        }
    }
  
  
}
