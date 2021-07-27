//
//  CustomTapGesture.swift
//  testingViews
//
//  Created by Rusu, Vlad on 7/26/21.
//

import UIKit

class CustomTapGesture: UITapGestureRecognizer {
    let index: Int
  
    init(target: AnyObject, action: Selector, index: Int) {
        self.index = index
        super.init(target: target, action: action)
    }
}

struct ElementColor{
    let backgroundColor = UIColor(red: 131/255, green: 151/255, blue: 136/255, alpha: 1)
    let buttonColor = UIColor(red: 238/255, green: 224/255, blue: 203/255, alpha: 1)
}
