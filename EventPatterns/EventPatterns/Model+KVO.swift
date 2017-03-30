//
//  KVOModel.swift
//  EventPatterns
//
//  Created by Jarrod Parkes on 3/8/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit
import Foundation

// MARK: - KVOModel: NSObject

class KVOModel: NSObject {
    
    // MARK: Properties
    
    dynamic var title: String?
    dynamic var image: UIImage?
    
    // MARK: Computed Properties
    
    var titleString: String {
        return title ?? "Placeholder"
    }
     var displayImage: UIImage {
        return image ?? #imageLiteral(resourceName: "placeholder")
    }
    
    // MARK: KVO Example (Send KVO Notifications)
    
    func set(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
}
