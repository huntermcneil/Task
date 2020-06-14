//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Hunter McNeil on 6/12/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {


    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var compleButton: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
    }
    
    func updateButton(_ isComplete: Bool) {
        if isComplete == true {
            compleButton.imageView?.image = UIImage(named: "complete")
        } else {
            compleButton.imageView?.image = UIImage(named: "incomplete")
        }
        //   isComplete = true ? compleButton.imageView?.image = UIImage(named: "complete") : compleButton.imageView?.image = UIImage(named: "incomplete")
    }
    
}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
        TaskController.shared.saveToPersistenceStore()
    }
}

