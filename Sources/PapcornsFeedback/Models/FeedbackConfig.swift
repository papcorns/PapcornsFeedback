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
    
    public init(cellBackgroundColor: UIColor? =  UIColor(red: 22/255, green: 25/255, blue: 37/255, alpha: 1.0),
                pageBackgroundColor: UIColor? = .black,
         feedbackMailAddress: String,
         submitButtonDeactiveBackgroundColor: UIColor? = UIColor(red: 22/255, green: 25/255, blue: 37/255, alpha: 1.0),
         submitButtonActiveBackgroundColor: UIColor? = .blue,
         submitButtonDeactiveTextColor: UIColor? = UIColor(red: 80/255, green: 87/255, blue: 112/255, alpha: 1.0),
         submitButtonActiveTextColor: UIColor? = .white,
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

 
