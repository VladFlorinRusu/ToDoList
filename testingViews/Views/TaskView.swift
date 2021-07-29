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
   // @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    let colors = ElementColor()

    // MARK: - INITIALISATION

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNib()
        textView.delegate = self
        button?.isHidden = true
    }

    func loadNib() {
        let view = Bundle.main.loadNibNamed(NIBNAME, owner: self, options: nil)?.first as? UIView
        view?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view?.frame = bounds
        designView(view)
        addSubview(view!)
    }

    // MARK: - ACTION

//    @IBAction func checkTextField(_ sender: Any) {
//        button.isHidden = !textView.hasText
//    }

    // MARK: - PRIVATE

    private func designView(_ view: UIView?) {
        view?.backgroundColor =  colors.backgroundColor
        button.layer.cornerRadius = button.layer.frame.height / 2
        button.backgroundColor =  colors.buttonColor
        button.tintColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    }

}

extension TaskView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        button.isHidden = !textView.hasText
    }
}
