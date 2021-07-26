//
//  TaskCell.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/20/21.
//

import UIKit

class TaskCell: UITableViewCell {

  @IBOutlet weak var taskLabel: UILabel!
  
  @IBOutlet weak var statusImage: UIImageView!
  
  
  // MARK: - OVERRIDES
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    createDesign()
    
    }
  // MARK: - DESIGN
  func createDesign()
  {self.contentView.backgroundColor = UIColor(red: 238/255, green: 224/255, blue: 203/255, alpha: 1)
  roundCorners([.topLeft, .bottomLeft, .bottomRight, .topRight], radius: self.bounds.height / 2)
 
  }
  
  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
    
  }
  
}
