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
    let colors = ElementColor()

    // MARK: - Initialisation

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        createDesign()
    }

//    func addGesture(index: Int) {
//        let gestureRecognizer = CustomTapGesture(target: self, action: #selector(toggleTask), index: index)
//        statusImage.addGestureRecognizer(gestureRecognizer)
//        statusImage.isUserInteractionEnabled = true
//    }
//    
    
    
    // MARK: - Design

    private func createDesign(){
        self.contentView.backgroundColor = colors.buttonColor
        roundCorners([.topLeft, .bottomLeft, .bottomRight, .topRight], radius: self.bounds.height / 2)
    }

    private func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    


}
