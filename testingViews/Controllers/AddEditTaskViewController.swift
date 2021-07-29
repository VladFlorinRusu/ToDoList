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
    weak var delegate: TaskDelegate?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        configureView()
    }

    // MARK: - Actions

    @objc func addTask() {
        // nu ar trebui sa dea nicioadata fail, butonul nu apare pana nu se tasteaza ceva...
        if let newTask = taskView.textView.text {
            TaskManagerImpl.taskManagerInstance.addNewActivity(activity: newTask)
            syncTableData()
            TaskManagerImpl.taskManagerInstance.showActivities()

        } else {
            print("no text added")
        }
        self.navigationController?.popViewController(animated: true)
    }

    @objc func editTask() {
        if let changedTask = taskView.textView.text {
            TaskManagerImpl.taskManagerInstance.changeTask(index: indexTask, newTask: changedTask)
            syncTableData()
        } else {
            print("edit - failed")
        }
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - Private Functions

    private func syncTableData() {
        delegate?.reloadData()
    }

    private func configureView() {
        if selectedTask == "" {
            title = "Add a new Task"
            taskView.button.setTitle("Add Task", for: .normal)
            taskView.button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        } else {
            self.title = "Edit Task"
            taskView.textView.text = selectedTask
            taskView.button.setTitle("Change Task", for: .normal)
            taskView.button.addTarget(self, action: #selector(editTask), for: .touchUpInside)
        }
    }

}
