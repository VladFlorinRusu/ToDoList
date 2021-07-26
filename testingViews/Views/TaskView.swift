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
    designView(view)
    addSubview(view!)
  }

  private func designView(_ view : UIView?)
  {
    view?.backgroundColor =  UIColor(red: 131/255, green: 151/255, blue: 136/255, alpha: 1.0)
    button.layer.cornerRadius = button.layer.frame.height / 2
    button.backgroundColor =  UIColor(red: 238/255, green: 224/255, blue: 203/255, alpha: 1)
    button.tintColor = .black
    button.layer.borderWidth = 1
    button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0 , alpha: 1.0)
  }
  
}


