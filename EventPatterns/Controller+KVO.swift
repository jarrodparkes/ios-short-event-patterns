//
//  KVOController.swift
//  EventPatterns
//
//  Created by Jarrod Parkes on 3/8/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - KVOController: UIViewController

class KVOController: UIViewController {
    
    // MARK: Properties
    
    var model = KVOModel()
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addObserver(self, forKeyPath: #keyPath(model.title), options: [.old, .new], context: nil)
        addObserver(self, forKeyPath: #keyPath(model.image), options: [.old, .new], context: nil)
        
        imageView.image = model.displayImage
        titleLabel.text = model.titleString
    }
    
    // MARK: Deinitialization
    
    deinit {
        removeObserver(self, forKeyPath: #keyPath(model.title))
        removeObserver(self, forKeyPath: #keyPath(model.image))
    }
    
    // MARK: KVO Example (Generate KVO Notifications)
    
    @IBAction func updateModel(_ sender: Any) {
        model.set(title: "Tahoe the Poodle", image: #imageLiteral(resourceName: "tahoe"))
    }

    // MARK: KVO Example (Observing KVO Notifications)
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(model.title) {
            titleLabel.text = model.titleString
        }
        if keyPath == #keyPath(model.image) {
            imageView.image = model.displayImage
        }
    }
}
