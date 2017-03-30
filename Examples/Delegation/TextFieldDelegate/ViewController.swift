//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Jarrod Parkes on 3/30/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {
    
    // MARK: Properties
    
    let colors: [UIColor] = [.red, .orange, .green, .blue, .purple, .brown]

    // MARK: Outlets
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
}

// MARK: - ViewController: UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = self.randomColor()
        return true
    }
    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        return colors[randomIndex]
    }
}
