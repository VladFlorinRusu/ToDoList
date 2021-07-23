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
  
  func createDesign()
  {self.contentView.backgroundColor = .systemOrange
  roundCorners([.topLeft, .bottomLeft], radius: self.bounds.height / 2)
  }
  
  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
    
  }
  
}
