//
//  ViewController.swift
//  NotificationBarSample
//
//  Created by kotala tetsuya on 2015/11/05.
//  Copyright © 2015年 kotalab. All rights reserved.
//

import UIKit
import CWStatusBarNotification

// https://github.com/cezarywojcik/CWStatusBarNotification
class CWViewController: UIViewController {
    
    @IBOutlet weak var barPosition: UISegmentedControl!
    @IBOutlet weak var fromAnimation: UISegmentedControl!
    @IBOutlet weak var toAnimation: UISegmentedControl!
    @IBOutlet weak var animationDurationLabel: UILabel!
    @IBOutlet weak var displayDurationLabel: UILabel!
    @IBOutlet weak var animataionSlider: UISlider!
    @IBOutlet weak var displaySlider: UISlider!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "CWStatusBar"
        animationDurationLabel.text = "AnimataionDuration: \(animataionSlider.value)"
        displayDurationLabel.text = "DisplayDuration: \(displaySlider.value)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CWViewController {
    
    @IBAction func slideAnimationDuration(sender: AnyObject) {
        
        guard let slider = sender as? UISlider else {
            return
        }
        animationDurationLabel.text = "AnimataionDuration: \(slider.value)"
    }
    
    @IBAction func slideDisplayDuration(sender: AnyObject) {
        
        guard let slider = sender as? UISlider else {
            return
        }
        displayDurationLabel.text = "DisplayDuration: \(slider.value)"
    }
    
    @IBAction func pushNotificationButton(sender: AnyObject) {

        let notification = CWStatusBarNotification()

        notification.notificationLabelBackgroundColor = UIColor.blueColor()
        notification.notificationLabelTextColor = UIColor.yellowColor()
        //        notification.notificationLabelFont =
        //        notification.notificationLabelHeight =
        //        notification.multiline = true
        //        notification.supportedInterfaceOrientations =
        notification.notificationAnimationDuration = Double(animataionSlider.value)
        notification.notificationStyle = CWNotificationStyle(rawValue: barPosition.selectedSegmentIndex) ?? .NavigationBarNotification
        notification.notificationAnimationInStyle = CWNotificationAnimationStyle(rawValue: fromAnimation.selectedSegmentIndex) ?? .Top
        notification.notificationAnimationOutStyle = CWNotificationAnimationStyle(rawValue: toAnimation.selectedSegmentIndex) ?? .Top
        
        notification.displayNotificationWithMessage(titleTextField.text, forDuration: Double(displaySlider.value))
    }
}

extension CWViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}