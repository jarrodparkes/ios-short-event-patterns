//
//  NotificationModel.swift
//  EventPatterns
//
//  Created by Jarrod Parkes on 3/8/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - NotificationModel

class NotificationModel {
    
    // MARK: Properties
    
    private var title: String! = nil
    private var image: UIImage! = nil    
    
    // MARK: Computed Properties
    
    var titleString: String {
        return title ?? "Placeholder"
    }
    var displayImage: UIImage {
        return image ?? #imageLiteral(resourceName: "placeholder")
    }
    
    // MARK: Notification Example
    
    func set(title: String, image: UIImage) {
        self.title = title
        self.image = image
        
        // emit notification, but don't send any extra data
        NotificationCenter.default.post(name: Notification.Name("modelDidUpdate"), object: nil)
        
        // emit notification, and send extra data
        // NotificationCenter.default.post(name: Notification.Name("modelDidUpdate"), object: nil, userInfo: ["value": 5])
    }
}
