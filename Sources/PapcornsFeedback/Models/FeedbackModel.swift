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
    
    public init(title: String) {
        self.title = title
    }
}

enum FeedbackSectionType: Int, CaseIterable {
    case options = 0
    case comment
}
