//
//  PapcornsFeedbackViewController.swift
//  
//
//  Created by kadir altıntop on 29.03.2023.
//

import UIKit

class PapcornsFeedbackViewController: UIViewController {

    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblList: UITableView!
    
    
    var config: FeedbackConfig!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI(){
        lblTitle.text = config.pageTitle
        tblList.delegate = self
        tblList.dataSource = self
        tblList.register(UINib(nibName: "FeedbackOptionCell", bundle: Bundle.module), forCellReuseIdentifier: "FeedbackOptionCell")
        
    }
    
    
    //MARK: Actions
    
    @IBAction func close_Tapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func submit_Tapped(_ sender: Any) {
        
    }
}


extension PapcornsFeedbackViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return config.feedbackTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let optionCell = tableView.dequeueReusableCell(withIdentifier: "FeedbackOptionCell", for:indexPath) as? FeedbackOptionCell {
            optionCell.prepareCell(with: self.config, row: indexPath.row)
            return optionCell
        }
        return UITableViewCell()
    }
    
    
}
