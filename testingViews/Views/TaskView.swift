//
//  TaskView.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/20/21.
//

import UIKit

class TaskView: UIView {
  let NIBNAME = "TaskView"
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var textField: UITextField!
 // @IBOutlet var contentView: TaskView!
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.loadNib()
    button!.isHidden = true
  }
  
  @IBAction func checkTextField(_ sender: Any) {
    if !textField.hasText
    {
      button.isHidden = true
    }
    else
    {
      button.isHidden = false
    }
  }
  
   func loadNib()
  {
    let view = Bundle.main.loadNibNamed(NIBNAME, owner: self, options:  nil)?.first as? UIView
    view?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    view?.frame = bounds
    
    addSubview(view!)
   
  }

  
}


