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
    var delegate: TaskSynchronization?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureView()
    }
    
    //MARK: - Actions
    
    @objc func addTask() {
        // nu ar trebui sa dea nicioadata fail, butonul nu apare pana nu se tasteaza ceva...
        if let newTask = taskView.textField.text {
            TaskManagerImpl.taskManagerInstance.addNewActivity(activity: newTask)
            syncTableData()
            TaskManagerImpl.taskManagerInstance.showActivities()
            
        } else {
            print("no text added")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func editTask() {
        if let changedTask = taskView.textField.text {
            TaskManagerImpl.taskManagerInstance.changeTask(index: indexTask, newTask: changedTask)
            syncTableData()
        } else {
            print("edit - failed")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Private Functions
    
    private func syncTableData() {//obtin referinta la taskTableVC si apelez reload data pentru a sincroniza
        //de folosit delegates in loc de smecheria de jos
      /*
        let currentVCIndex = navigationController?.viewControllers.firstIndex(of: self)
        let previousVC = navigationController?.viewControllers[currentVCIndex! - 1] as? TaskTableViewController
        previousVC?.tableView.reloadData()
 */
        print("sync")
        delegate?.reloadData()
    }
    
    private func configureView() {
        if selectedTask == "" {
            title = "Add a new Task"
            taskView.textField.placeholder = "To Do ..."
            taskView.button.setTitle("Add Task", for: .normal)
            taskView.button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        } else {
            self.title = "Edit Task"
            taskView.textField.text = selectedTask
            taskView.button.setTitle("Change Task", for: .normal)
            taskView.button.addTarget(self, action: #selector(editTask), for: .touchUpInside)
        }
    }
    
    
}
