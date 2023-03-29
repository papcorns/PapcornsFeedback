//
//  PapcornsFeedbackViewController.swift
//  
//
//  Created by kadir altıntop on 29.03.2023.
//

import UIKit

class PapcornsFeedbackViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    var config: FeedbackConfig!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func setupUI(){
        lblTitle.text = config.pageTitle
    }
    
    
    //MARK: Actions
    
    @IBAction func close_Tapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
