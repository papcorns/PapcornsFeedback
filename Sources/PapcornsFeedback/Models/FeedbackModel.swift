//
//  File.swift
//  
//
//  Created by kadir altıntop on 29.03.2023.
//

import Foundation
import UIKit

public struct FeedbackModel {
    var title: String
    var titleFont: UIFont?
   
    init(title: String, titleFont: UIFont? = UIFont.systemFont(ofSize: 17)) {
        self.title = title
        self.titleFont = titleFont
    }

}
