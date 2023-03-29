//
//  File.swift
//  
//
//  Created by kadir altıntop on 29.03.2023.
//

import Foundation
import UIKit

public struct FeedbackConfig  {
    
    var cellBackgroundColor: UIColor? = UIColor(hex: "#161825")
    var cellTextFont: UIFont? = UIFont.systemFont(ofSize: 17)
    var cellTextColor: UIColor? = .white
    var cellCornerRadius: Int? = 10
    
    var pageBackgroundColor: UIColor? = .black
    var feedbackMailAddress: String
    var submitButtonDeactiveBackgroundColor: UIColor?
    var submitButtonActiveBackgroundColor: UIColor?
    var submitButtonDeactiveTextColor: UIColor?
    var submitButtonActiveTextColor: UIColor?
    var pageTitle: String?
    
    var feedbackTypes: [FeedbackModel]
    
    public init(cellBackgroundColor: UIColor? = nil,
         pageBackgroundColor: UIColor? = nil,
         feedbackMailAddress: String,
         submitButtonDeactiveBackgroundColor: UIColor? = UIColor(hex: "#161825"),
         submitButtonActiveBackgroundColor: UIColor? = .blue,
         submitButtonDeactiveTextColor: UIColor? = UIColor(hex: "#505770"),
         submitButtonActiveTextColor: UIColor? = .white,
         pageTitle: String? = "Send Feedback",
         feedbackTypes: [FeedbackModel],
         cellTextColor: UIColor? = .white,
         cellTextFont: UIFont? = UIFont.systemFont(ofSize: 17)) {
        
        self.cellBackgroundColor = cellBackgroundColor
        self.cellTextFont = cellTextFont
        self.cellTextColor = cellTextColor
        self.pageBackgroundColor = pageBackgroundColor
        self.feedbackMailAddress = feedbackMailAddress
        self.submitButtonDeactiveBackgroundColor = submitButtonDeactiveBackgroundColor
        self.submitButtonActiveBackgroundColor = submitButtonActiveBackgroundColor
        self.submitButtonDeactiveTextColor = submitButtonDeactiveTextColor
        self.submitButtonActiveTextColor = submitButtonActiveTextColor
        self.pageTitle = pageTitle
        self.feedbackTypes = feedbackTypes
    }
    
    
    
}

 
