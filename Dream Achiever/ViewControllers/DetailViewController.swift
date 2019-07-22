//
//  DetailViewController.swift
//  Dream Achiever
//
//  Created by Aakash Shah on 19/07/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    private static let kSTORYBOARD_ID = "Detail"

    @IBOutlet weak var stackView: UIStackView!
    
    private(set) var goals = [Goal]()
    
    // Dependency injection
    static func storyboardInstance(with goals: [Goal]) -> DetailViewController {
        let vc = UIStoryboard.main.instantiateViewController(withIdentifier: kSTORYBOARD_ID) as! DetailViewController
        vc.goals = goals
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for goal in goals {
            let label = createLabel(with: goal.name)
            stackView.addArrangedSubview(label)
        }
    }
    
    private func createLabel(with text: String?) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text
        label.textColor = UIColor.white
        return label
    }
}
