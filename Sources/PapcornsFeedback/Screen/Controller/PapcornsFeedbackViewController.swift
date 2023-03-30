//
//  PapcornsFeedbackViewController.swift
//  
//
//  Created by kadir altıntop on 29.03.2023.
//

import UIKit

class PapcornsFeedbackViewController: UIViewController {

    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblList: UITableView!
    
    var selectedFeedback: FeedbackModel?
    var config: FeedbackConfig!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI(){
        self.view.backgroundColor = config.pageBackgroundColor
        lblTitle.text = config.pageTitle
        btnClose.setTitle("", for: .normal)
        tblList.delegate = self
        tblList.dataSource = self
        tblList.separatorStyle = .none
        if #available(iOS 15.0, *) {
            tblList.sectionHeaderTopPadding = 0
        }
        tblList.register(UINib(nibName: "FeedbackOptionCell", bundle: Bundle.module), forCellReuseIdentifier: "FeedbackOptionCell")
        tblList.register(UINib(nibName: "CommentTableViewCell", bundle: Bundle.module), forCellReuseIdentifier: "CommentTableViewCell")
        
    }
    
    
    //MARK: Actions
    
    @IBAction func close_Tapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func submit_Tapped(_ sender: Any) {
        guard self.selectedFeedback != nil else {
            let alert = UIAlertController(title: "Please select subject", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        
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
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
