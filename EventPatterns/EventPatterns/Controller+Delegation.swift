//
//  DelegationController.swift
//  EventPatterns
//
//  Created by Jarrod Parkes on 3/8/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - DelegationController: UIViewController

class DelegationController: UIViewController {

    // MARK: Properties
    
    var model = DelegationModel()
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        model.delegate = self
        setupUI()
    }
    
    // MARK: Setup UI
    
    func setupUI() {
        imageView.image = model.displayImage
        titleLabel.text = model.titleString
    }
    
    // MARK: Delegation Example (Triggers Delegation)
    
    @IBAction func updateModel(_ sender: Any) {
        model.set(title: "Biscuits the Terrier", image: #imageLiteral(resourceName: "biscuits"))
    }
}

// MARK: - DelegationController: DelegationModelDelegate

extension DelegationController: DelegationModelDelegate {
    
    // MARK: Delegation Example (Delegate Implementation)
    
    func modelDidUpdate() {
        setupUI()
    }
}
