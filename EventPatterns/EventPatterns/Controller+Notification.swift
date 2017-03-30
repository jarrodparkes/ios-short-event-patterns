//
//  NotificationController.swift
//  EventPatterns
//
//  Created by Jarrod Parkes on 3/8/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - NotificationController: UIViewController

class NotificationController: UIViewController {

    // MARK: Properties
    
    var model = NotificationModel()
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {        
        NotificationCenter.default.addObserver(self, selector: #selector(modelDidUpdate), name: Notification.Name("modelDidUpdate"), object: nil)
        setupUI()
    }
    
    // MARK: Deinitialization
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Setup UI
    
    func setupUI() {
        imageView.image = model.displayImage
        titleLabel.text = model.titleString
    }
    
    // MARK: Notification Example (Generates Notification)
    
    @IBAction func updateModel(_ sender: Any) {
        model.set(title: "Eloise the Tortoiseshell", image: #imageLiteral(resourceName: "eloise"))
    }
    
    // MARK: Notification Example (Observe Notification)
    
    func modelDidUpdate(notification: Notification) {        
        setupUI()
    }
}
