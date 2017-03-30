//
//  DelegationModel.swift
//  EventPatterns
//
//  Created by Jarrod Parkes on 3/8/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - DelegationModelDelegate

protocol DelegationModelDelegate {
    func modelDidUpdate()
}

// MARK: - DelegationModel

class DelegationModel {
    
    // MARK: Properties
    
    private var title: String! = nil
    private var image: UIImage! = nil
    var delegate: DelegationModelDelegate? = nil
    
    // MARK: Computed Properties
    
    var titleString: String {
        return title ?? "Placeholder"
    }
    var displayImage: UIImage {
        return image ?? #imageLiteral(resourceName: "placeholder")
    }
    
    // MARK: Delegation Example
    
    func set(title: String, image: UIImage) {
        self.title = title
        self.image = image
        delegate?.modelDidUpdate()
    }
}
