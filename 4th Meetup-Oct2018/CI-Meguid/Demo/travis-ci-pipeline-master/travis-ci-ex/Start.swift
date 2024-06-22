//
//  ViewController.swift
//  travis-ci-ex
//
//  Created by Ahmed Abdel Meguid on 9/4/18.
//  Copyright © 2018 Ahmed Abdel Meguid. All rights reserved.
//

import UIKit

class Start: UIViewController {

    @IBOutlet weak var statusButton: UILabel!
    @IBOutlet var actionButtons: [UIButton]!

    @IBAction func acitonDone(_ sender: UIButton) {
        if let index = getIntIndex(for: sender, at: actionButtons) {
            statusButton.text = detectStatus(index: index)
        }
    }

    func getIntIndex(for button: UIButton, at buttons: [UIButton]) -> Int? {
        if let index = buttons.index(of: button) {
            return buttons.distance(from: buttons.startIndex, to: index)
        }
        return nil
    }
    
    func detectStatus(index: Int) -> String {
        if index == 0 {
            return Status.invalid.rawValue
        }
        return Status.fine.rawValue
    }
}

enum Status: String {
    case invalid = "Why you've done this"
    case fine = "No Problem"
}
