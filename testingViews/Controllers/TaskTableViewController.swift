//
//  myTodoListTableViewController.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/19/21.
//
//de afisat lista dupa ce adaugi un element nou!!
//add si edit in in acelasi controller
//culoarea de la butonul de add sa fie neagra
// de pus gesture in celula
// indentat
//schimbat textul la MARK

import UIKit

class TaskTableViewController: UITableViewController {
  
//MARK: - Properties
    let myCustomCell = "TaskCell"
    var taskManager = TaskManagerImpl.taskManagerInstance
    var addButton = UIButton()
    let colors = ElementColor()

    @IBOutlet weak var navigationBar: UINavigationItem!

    @IBOutlet weak var addNavBarButton: UIBarButtonItem!
  
  // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
  //taskManager.addNewActivity(activity: "Do the shopping")
  //taskManager.addNewActivity(activity: "Go walk the dog")
        registerCells()
        configureTable()
      
      
    }
  
  
    override func viewWillAppear(_ animated: Bool) {
        self.title = "TO DO"
        if taskManager.numberOfTasks > 0 {
            configureTable()
        }
        else {
            createAddButton()
        }
    }

  //MARK: - Configuration/ Design
  
    func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SimpleCell")
        tableView.register(UINib(nibName: myCustomCell, bundle: nil), forCellReuseIdentifier: myCustomCell)
    }
  
    // MARK: - Override -> UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.numberOfTasks
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCustomCell, for: indexPath) as? TaskCell
        
        //adding a gesture for detecting if the image was tapped
        // cell?.addGesture(index: indexPath.row)
        addGesture(cell: cell, index: indexPath.row)
        configureCell(cell: cell, index: indexPath.row)
        return cell!
    }
  
//MARK: - Override -> UITableViewDelegate
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = taskManager.taskAt(at: indexPath.row).activity
        if let editTaskVC = storyboard?.instantiateViewController(identifier: "AddEditTaskViewController") as? AddEditTaskViewController{
            print("edit")
            editTaskVC.selectedTask = selectedTask
            editTaskVC.indexTask = indexPath.row
            navigationController?.pushViewController(editTaskVC, animated: true)
        }
    }
  
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView(frame: .zero)
    }
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
            // Delete the row from the data source
                taskManager.deleteActivity(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
                if taskManager.numberOfTasks == 0 {
                    createAddButton()
                }
            }
    }
    
  // MARK: - Actions
  
    @objc func toggleTask(_ sender : UITapGestureRecognizer)
    {
        let source = sender as! CustomTapGesture
        taskManager.toggleActivity(index: source.index)
        tableView.reloadData()
    }
  
  
    @objc func addNewTask()
    {
        if let AddNewTaskVC = storyboard?.instantiateViewController(identifier: "AddEditTaskViewController") as? AddEditTaskViewController {
            AddNewTaskVC.selectedTask = ""
            navigationController?.pushViewController(AddNewTaskVC, animated: true)
        }
    }
  
  //MARK: - Private Methods
  
    private func configureTable() {
        tableView.layer.cornerRadius = 10
        self.tableView.rowHeight = 44
        tableView.backgroundView?.isHidden = true
        addNavBarButton.isEnabled = true
        tableView.backgroundView = UIView()
        tableView.backgroundView?.center = tableView.center
        tableView.backgroundView?.backgroundColor = colors.backgroundColor
        navigationController?.navigationBar.barTintColor = colors.backgroundColor
    }
  
    private func createAddButton() {
        addNavBarButton.isEnabled = false
        tableView.separatorColor = UIColor .clear
        addButton.backgroundColor =  colors.buttonColor
        addButton.center = tableView.center
        addButton.setTitle("Add Task", for: .normal)
        addButton.addTarget(self, action: #selector(addNewTask), for: UIControl.Event.touchUpInside )
        addButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        addButton.center = tableView.center
        addButton.layer.borderWidth = 1
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0 , alpha: 1.0)
        addButton.layer.cornerRadius = addButton.layer.frame.height / 2
        tableView.isScrollEnabled = false
        tableView.backgroundView?.addSubview(addButton)
    }
  
    private func configureCell(cell: TaskCell?, index: Int){
        cell?.taskLabel?.text = taskManager.taskAt(at: index).activity
        if taskManager.taskAt(at: index).completed == false {
            cell?.statusImage?.image = UIImage(systemName: "circle")
        }
        else {
            cell?.statusImage?.image = UIImage(systemName: "checkmark")
        }
    }
  
    private func addGesture(cell: TaskCell?, index: Int) {
        let gestureRecognizer = CustomTapGesture(target: self, action: #selector(toggleTask), index: index)
        cell?.statusImage.addGestureRecognizer(gestureRecognizer)
        cell?.statusImage.isUserInteractionEnabled = true
    }
    
}
