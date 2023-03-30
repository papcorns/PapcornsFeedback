//
//  CommentTableViewCell.swift
//  
//
//  Created by kadir altıntop on 30.03.2023.
//

import UIKit

protocol CommentCellDelegate {
    func updateComment(with text: String)
}

class CommentTableViewCell: UITableViewCell, UITextViewDelegate{

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var commentTextView: UITextView!
    
    var delegate: CommentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        commentTextView.text = "Tell us about the problem"
        commentTextView.textColor = UIColor(hex: "#8F92A0")
        commentTextView.returnKeyType = .done
        commentTextView.delegate = self
        containerView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Tell us about the problem" {
            textView.text = ""
            textView.textColor = .white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            commentTextView.text = "Tell us about the problem"
            commentTextView.textColor = UIColor(hex: "#8F92A0")
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
         if text == "\n" {
             textView.resignFirstResponder()
         }
        self.delegate?.updateComment(with: text)
         return true
     }
    
    
}
