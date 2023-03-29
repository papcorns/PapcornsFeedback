//
//  FeedbackOptionCell.swift
//  
//
//  Created by kadir altıntop on 29.03.2023.
//

import UIKit

class FeedbackOptionCell: UITableViewCell {

    @IBOutlet weak var imgSelection: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override var isSelected: Bool{
        get {
            super.isSelected
        }
        set{
            if newValue {
                imgSelection.image = UIImage(named: "feedback_selected_icon")!
            }else {
                imgSelection.image = UIImage(named: "feedback_unselected_icon")!
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareCell(with model: FeedbackConfig, row: Int) {
        backgroundColor = .clear
        containerView.backgroundColor = model.cellBackgroundColor
        lblTitle.textColor = model.cellTextColor
        lblTitle.text = model.feedbackTypes[row].title
        containerView.layer.cornerRadius = CGFloat(model.cellCornerRadius ?? 10)
        if let font = model.cellTextFont {
            lblTitle.font = font
        }
    }
}
