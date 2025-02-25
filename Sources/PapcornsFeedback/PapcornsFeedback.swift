

import UIKit
import Foundation

public struct PapcornsFeedback {
    
    var config: FeedbackConfig
    var destinationViewController: UIViewController
    
    public init(config: FeedbackConfig, destination:UIViewController) {
        self.config = config
        self.destinationViewController = destination
    }
    
    public func presentFeedback(){
        let storyboard = UIStoryboard(name: "SendFeedback", bundle: Bundle.module)
        if let vc = storyboard.instantiateInitialViewController() as? PapcornsFeedbackViewController {
            vc.config = config
            destinationViewController.present(vc, animated: true)
        }
    }
}
