//
//  ViewController.swift
//  Dream Achiever
//
//  Created by Aakash Shah on 19/07/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var InnerStackView: UIStackView!
    @IBOutlet weak var submitButton: UIButton!
  
    
    let kGOAL_COUNT = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dream Achiever"
        
        submitButton.layer.borderWidth = 1
        submitButton.layer.cornerRadius = 8
        submitButton.layer.borderColor = UIColor.black.cgColor
        
        
        for index in 1...kGOAL_COUNT {
            let textfield = createTextField(with: "Enter Your \(index) Goal here")
            InnerStackView.addArrangedSubview(textfield)
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        var goals = [Goal]()
        for view in InnerStackView.arrangedSubviews{
           guard let value = view as? UITextField else { return }
           goals.append(Goal(name: value.text))
        }
        let vc = DetailViewController.storyboardInstance(with: goals)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createTextField(with placeHolder: String?) -> UITextField {
        let textField = UITextField(frame: .zero)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.placeholder = placeHolder
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 7.0
//        textField.layer.shadowColor = UIColor.white.cgColor
//        textField.layer.shadowOffset = .zero
//        textField.layer.shadowOpacity = 0.7
//        textField.layer.shadowRadius = 10.0
//        textField.layer.shadowPath = UIBezierPath(rect: textField.bounds).cgPath
//        textField.layer.shouldRasterize = true
        
        
        let heightConstraint = NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        textField.addConstraint(heightConstraint)
        return textField
    }
}
