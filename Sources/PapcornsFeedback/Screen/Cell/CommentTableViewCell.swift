//
//  CommentTableViewCell.swift
//  
//
//  Created by kadir altıntop on 30.03.2023.
//

import UIKit

class CommentTableViewCell: UITableViewCell, UITextViewDelegate{

    @IBOutlet weak var commentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commentTextView.text = "Tell us about the problem"
        commentTextView.textColor = UIColor(hex: "#8F92A0")
        commentTextView.returnKeyType = .done
        commentTextView.delegate = self
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
    
}
