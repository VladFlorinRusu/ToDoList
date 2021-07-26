//
//  myTodoListTableViewController.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/19/21.
//

import UIKit

class TaskTableViewController: UITableViewController {
  
  
  let myCustomCell = "TaskCell"
  var taskManager = TaskManager.taskManagerInstance
  var addButton = UIButton()
  let greenColor = UIColor(red: 131/255, green: 151/255, blue: 136/255, alpha: 1)
  let buttonColor = UIColor(red: 238/255, green: 224/255, blue: 203/255, alpha: 1)
  
  
  
  @IBOutlet weak var navigationBar: UINavigationItem!
  
  @IBOutlet weak var addNavBarButton: UIBarButtonItem!
  
  // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
      taskManager.addNewActivity(activity: "Do the shopping")
      taskManager.addNewActivity(activity: "Go walk the dog")
      registerCells()
      
      //tableView.backgroundColor = UIColor(red: 131/255, green: 151/255, blue: 136/255, alpha: 1)
      
    }
  
  
  override func viewWillAppear(_ animated: Bool) {
    
    if taskManager.dataSource.count > 0{
      configureTable()
    }
    
    else
    {
      createAddButton()
    }
  }

  //MARK: - CONFIGURATION/DESIGN
  
  func registerCells(){
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SimpleCell")
    tableView.register(UINib(nibName: myCustomCell, bundle: nil), forCellReuseIdentifier: myCustomCell)
  }
  
  
  
  func configureTable()
  { tableView.layer.cornerRadius = 10
    self.tableView.rowHeight = 44
    tableView.backgroundView?.isHidden = true
    addNavBarButton.isEnabled = true
    tableView.backgroundView = UIView()
    tableView.backgroundView?.center = tableView.center
    tableView.backgroundView?.backgroundColor = greenColor
    navigationController?.navigationBar.barTintColor = greenColor
  }
  
  
  
  
  func createAddButton(){
    addNavBarButton.isEnabled = false
    
    
    tableView.separatorColor = UIColor .clear

    addButton.backgroundColor =  buttonColor
    addButton.center = tableView.center
    addButton.setTitle("Add Task", for: .normal)
    addButton.addTarget(self, action: #selector(addNewTask), for: UIControl.Event.touchUpInside )
    addButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
    addButton.center = tableView.center
    addButton.layer.borderWidth = 1
    addButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0 , alpha: 1.0)
    addButton.layer.cornerRadius = addButton.layer.frame.height / 2
    
    tableView.backgroundView?.addSubview(addButton)
    
    
  }
  
  
  

    // MARK: - OVERRIDES

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
     
      return taskManager.dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCustomCell, for: indexPath) as? TaskCell
      
      //adding a gesture for detecting if the image was tapped
      let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleTask))
      cell?.statusImage.addGestureRecognizer(gestureRecognizer)
      cell?.statusImage.isUserInteractionEnabled = true
      cell?.statusImage.tag = indexPath.row
                                                                      
      cell?.taskLabel?.text = taskManager.dataSource[indexPath.row].0
      if taskManager.dataSource[indexPath.row].1 == false
      {cell?.statusImage?.image = UIImage(systemName: "circle")
        
      }
      else
      {cell?.statusImage?.image = UIImage(systemName: "checkmark") }
        // Configure the cell...
      
        return cell!
    }
    
  
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
    let selectedTask = taskManager.dataSource[indexPath.row].0
    //performSegue(withIdentifier: "openEdit", sender: self)
    if let editTaskVC = storyboard?.instantiateViewController(identifier: "EditTaskViewController") as? EditTaskViewController{
      
      editTaskVC.selectedTask = selectedTask
      editTaskVC.indexTask = indexPath.row
      navigationController?.pushViewController(editTaskVC, animated: true)
    }
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView(frame: .zero)
  }

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
          taskManager.deleteActivity(index: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .fade)
          tableView.reloadData()
          if taskManager.dataSource.count == 0
          {createAddButton()}
        }
      
      
    }
  // MARK: - ACTIONS
  
  @objc func toggleTask(_ sender : UITapGestureRecognizer)
  {taskManager.toggleActivity(index: sender.view!.tag)
    tableView.reloadData()
  }
  
  
  @objc func addNewTask()
  {
    if let AddNewTaskVC = storyboard?.instantiateViewController(identifier: "AddTaskViewController") as? AddTaskViewController {
      navigationController?.pushViewController(AddNewTaskVC, animated: true)
      
    }
  }
  
    
}
