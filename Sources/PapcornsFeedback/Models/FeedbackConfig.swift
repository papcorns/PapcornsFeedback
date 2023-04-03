//
//  File.swift
//  
//
//  Created by kadir altıntop on 29.03.2023.
//

import Foundation
import UIKit

public struct FeedbackConfig  {
    
    public var cellBackgroundColor: UIColor? = UIColor(hex: "#161825")
    public var cellTextFont: UIFont? = nil
    public var cellTextColor: UIColor? = .white
    public var cellCornerRadius: Int? = 10
  
    public var pageBackgroundColor: UIColor? = .black
    public var feedbackMailAddress: String
    public var submitButtonDeactiveBackgroundColor: UIColor?
    public var submitButtonActiveBackgroundColor: UIColor?
    public var submitButtonDeactiveTextColor: UIColor?
    public var submitButtonActiveTextColor: UIColor?
    public var pageTitle: String?
    public var mailInfo: String? // device id , name , firebase id
 
    public var feedbackTypes: [FeedbackModel]
    
    public init(cellBackgroundColor: UIColor? = UIColor(hex: "#161825"),
                pageBackgroundColor: UIColor? = UIColor(hex: "#07080D"),
         feedbackMailAddress: String,
         submitButtonDeactiveBackgroundColor: UIColor? = UIColor(hex: "#161825"),
         submitButtonActiveBackgroundColor: UIColor? = .blue,
         submitButtonDeactiveTextColor: UIColor? = UIColor(hex: "#505770"),
         submitButtonActiveTextColor: UIColor? = UIColor(hex: "#07080D"),
         pageTitle: String? = "Send Feedback",
         feedbackTypes: [FeedbackModel],
         cellTextColor: UIColor? = .white,
         cellTextFont: UIFont? = nil,
         mailInfo:String? = nil) {
        
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
        self.mailInfo = mailInfo
    }
    
    
    
}

 
