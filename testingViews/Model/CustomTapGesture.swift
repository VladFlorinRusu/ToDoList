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
