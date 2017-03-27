//
//  CallbackController.swift
//  EventPatterns
//
//  Created by Jarrod Parkes on 3/8/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - CallbackController: UIViewController

class CallbackController: UIViewController {

    // MARK: Properties
    
    var model = CallbackModel(title: "Placeholder", image: #imageLiteral(resourceName: "placeholder"))
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Setup UI
    
    func setupUI() {
        imageView.image = model.image
        titleLabel.text = model.title
    }
    
    // MARK: Callback Example
    
    @IBAction func updateModel(_ sender: Any) {
        CallbackModel.setRandomTitleAndImage { callbackModel in
            self.model = callbackModel
            self.setupUI()
        }
    }
}
