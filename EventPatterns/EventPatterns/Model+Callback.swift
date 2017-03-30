//
//  CallbackModel.swift
//  EventPatterns
//
//  Created by Jarrod Parkes on 3/8/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit
import Foundation

// MARK: - CallbackModel

struct CallbackModel {
    
    // MARK: Properties
    
    let title: String
    let image: UIImage
    
    // MARK: Callback Example
    
    static func setRandomTitleAndImage(callback: @escaping (CallbackModel) -> Void) {
        let url = URL(string: "https://unsplash.it/600/400/?random")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    callback(CallbackModel(title: "Placeholder", image: #imageLiteral(resourceName: "placeholder")))
                } else {
                    callback(CallbackModel(title: "Random Image", image: UIImage(data: data!)!))
                }
            }
        }
        task.resume()
    }
}
