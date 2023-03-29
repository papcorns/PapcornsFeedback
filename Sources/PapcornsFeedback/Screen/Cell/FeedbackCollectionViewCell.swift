////
////  FeedbackCollectionViewCell.swift
////  AIArt
////
////  Created by Oktay Kurt on 24.03.2023.
////
//
//import UIKit
//
//class FeedbackCollectionViewCell: UICollectionViewCell {
//    
//    @IBOutlet weak var feedbackNameLabel: UILabel!
//    @IBOutlet weak var feedbackSelectionImageView: UIImageView!
//    
//    override var isSelected: Bool {
//        get {
//            super.isSelected
//        }
//        
//        set {
//            if newValue {
//                feedbackSelectionImageView.image = UIImage(named: "Paywall-SelectedIcon")?.withRenderingMode(.alwaysOriginal)
//            } else {
//                feedbackSelectionImageView.image = UIImage(named: "Paywall-UnselectedIcon")?.withRenderingMode(.alwaysOriginal)
//            }
//        }
//    }
//    
//    func prepareForDrawing(feedback: FeedbackType) {
//        self.layer.backgroundColor = UIColor(red: 0.086, green: 0.094, blue: 0.145, alpha: 1).cgColor
//        self.layer.cornerRadius = 10
//        feedbackNameLabel.text = feedback.title
//        feedbackNameLabel.textColor = .white
//        feedbackNameLabel.font = UIFont(name: "SFProDisplay-Regular", size: 17)
//        feedbackNameLabel.numberOfLines = 1
//        feedbackNameLabel.adjustsFontSizeToFitWidth = true
//        feedbackSelectionImageView.image = UIImage(named: "Paywall-UnselectedIcon")?.withRenderingMode(.alwaysOriginal)
//    }
//}
