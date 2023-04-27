//
//  PapcornsFeedbackViewController.swift
//  
//
//  Created by kadir altıntop on 29.03.2023.
//

import UIKit
import MessageUI

class PapcornsFeedbackViewController: UIViewController {

    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblList: UITableView!
    
    var selectedCell : UITableViewCell?
    var selectedFeedback: FeedbackModel?
    var comment: String?
    var config: FeedbackConfig!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI(){
        self.view.backgroundColor = config.pageBackgroundColor
        lblTitle.text = config.pageTitle
        btnSubmit.backgroundColor = config.submitButtonDeactiveBackgroundColor
        btnSubmit.setTitleColor(config.submitButtonDeactiveTextColor, for: .normal)
        btnSubmit.layer.cornerRadius = CGFloat(config.cellCornerRadius ?? 12)
        btnSubmit.titleLabel?.font = config.submitButtonFont
        lblTitle.font = config.titleFont
        btnClose.setTitle("", for: .normal)
        tblList.delegate = self
        tblList.dataSource = self
        tblList.separatorStyle = .none
        tblList.allowsMultipleSelection = false
        tblList.allowsSelection = true
        
        if #available(iOS 15.0, *) {
            tblList.sectionHeaderTopPadding = 0
        }
        
        tblList.register(UINib(nibName: "FeedbackOptionCell", bundle: Bundle.module), forCellReuseIdentifier: "FeedbackOptionCell")
        tblList.register(UINib(nibName: "CommentTableViewCell", bundle: Bundle.module), forCellReuseIdentifier: "CommentTableViewCell")
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        tapGesture.cancelsTouchesInView = false
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        tblList.isUserInteractionEnabled = false
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            self.view.frame.origin.y = 0 - keyboardHeight
            UIView.animate(withDuration: 0.15) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        tblList.isUserInteractionEnabled = true
        self.view.frame.origin.y = 0
    }
    
    @objc func viewTapped(sender: Any) {
        self.view.endEditing(true)
    }
    
    func setButtonActive() {
        btnSubmit.backgroundColor = config.submitButtonActiveBackgroundColor
        btnSubmit.setTitleColor(config.submitButtonActiveTextColor, for: .normal)
    }
    
    func setButtonDeactive(){
        btnSubmit.backgroundColor = config.submitButtonDeactiveBackgroundColor
        btnSubmit.setTitleColor(config.submitButtonDeactiveTextColor, for: .normal)
    }
    
    func showAlertWith(title:String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func sendMail(){
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([config.feedbackMailAddress])
            mail.setSubject(config.subject ?? "")
            mail.setMessageBody("Issue: \(selectedFeedback?.title ?? "Bug")\nFeedback: \(comment!)\n\n \(config?.mailInfo ?? "")", isHTML: false)
            present(mail, animated: true)
        }
    }
    
    //MARK: Actions
    
    @IBAction func close_Tapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func submit_Tapped(_ sender: Any) {
        guard self.selectedFeedback != nil else {
            showAlertWith(title: "Please select subject")
            return
        }
        
        guard self.comment != nil else {
            showAlertWith(title: "Please write comment")
            return
        }
        sendMail()
    }
}


extension PapcornsFeedbackViewController : UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return FeedbackSectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == FeedbackSectionType.options.rawValue {
            return config.feedbackTypes.count
        }else if section == FeedbackSectionType.comment.rawValue {
            return 1
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        if indexPath.section ==  FeedbackSectionType.options.rawValue  {
            if let optionCell = tableView.dequeueReusableCell(withIdentifier: "FeedbackOptionCell", for:indexPath) as? FeedbackOptionCell {
                optionCell.prepareCell(with: self.config, row: indexPath.row)
                return optionCell
            }
        }else if indexPath.section == FeedbackSectionType.comment.rawValue {
            if let commentCell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for:indexPath) as? CommentTableViewCell {
                commentCell.delegate = self
                commentCell.containerView.backgroundColor = config.cellBackgroundColor
                return commentCell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == FeedbackSectionType.options.rawValue {
            return 64
        }else if indexPath.section == FeedbackSectionType.comment.rawValue {
            return 160
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == FeedbackSectionType.options.rawValue {
            self.selectedFeedback = config.feedbackTypes[indexPath.row]
            
            if let cell = self.selectedCell {
                cell.isSelected = false
            }
            self.selectedCell = tableView.cellForRow(at: indexPath)
            tableView.cellForRow(at: indexPath)?.isSelected = true
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        let label = UILabel(frame: CGRect(x: 32, y: 0, width: 150, height: 40))
        if section == FeedbackSectionType.options.rawValue {
            label.text = "Select a subject"
        }else {
            label.text = "Comment"
        }        
        label.textColor = config.headerTitleColor ??  UIColor(red: 143/255, green: 146/255, blue: 160/255, alpha: 1.0)
        if let font = config.headerLabelFont {
            label.font = font
        }
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}


extension PapcornsFeedbackViewController : CommentCellDelegate {
    func updateComment(with text: String) {
        self.comment = text
        if text != "" {
            self.setButtonActive()
        }else {
            self.setButtonDeactive()
        }
    }
}


extension PapcornsFeedbackViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.12, execute: DispatchWorkItem(block: {
            self.dismiss(animated: true)
        }))
    }
}
