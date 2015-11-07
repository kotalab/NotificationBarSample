//
//  TSViewController.swift
//  NotificationBarSample
//
//  Created by kotala tetsuya on 2015/11/05.
//  Copyright © 2015年 kotalab. All rights reserved.
//

import UIKit
import TSMessages

// https://github.com/KrauseFx/TSMessages
class TSViewController: UIViewController {

    @IBOutlet weak var notificationType: UISegmentedControl!
    @IBOutlet weak var notificationPosition: UISegmentedControl!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var subtitleText: UITextField!
    @IBOutlet weak var durationSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "TSMessage"
        durationLabel.text = "Duration: \(durationSlider.value)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TSViewController {
    
    @IBAction func slideDuration(sender: AnyObject) {
        
        guard let slider = sender as? UISlider else {
            return
        }
        durationLabel.text = "Duration: \(slider.value)"
    }
    
    @IBAction func pushNotificationButton(sender: AnyObject) {
        let type = TSMessageNotificationType(rawValue: notificationType.selectedSegmentIndex) ?? .Message
        let position = TSMessageNotificationPosition(rawValue: notificationPosition.selectedSegmentIndex) ?? .Top
        
        TSMessage.showNotificationInViewController(self.navigationController,
            title: titleText.text,
            subtitle: subtitleText.text,
            image: nil,
            type: type,
            duration: Double(durationSlider.value),
            callback: nil,
            buttonTitle: nil,
            buttonCallback: nil,
            atPosition: position,
            canBeDismissedByUser: true)
    }
}

extension TSViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}