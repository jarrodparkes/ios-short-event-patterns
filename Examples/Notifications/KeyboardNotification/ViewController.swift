//
//  ViewController.swift
//  KeyboardNotification
//
//  Created by Jarrod Parkes on 3/30/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var textfield: UITextField!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    // MARK: Keyboard
    
    func keyboardWillShow() {
        view.backgroundColor = .lightGray
    }
    
    func keyboardWillHide() {
        view.backgroundColor = .blue
    }
}

// MARK: - ViewController: UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
}
