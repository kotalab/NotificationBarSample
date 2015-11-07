//
//  JDViewController.swift
//  NotificationBarSample
//
//  Created by kotala tetsuya on 2015/11/05.
//  Copyright © 2015年 kotalab. All rights reserved.
//

import UIKit
import JDStatusBarNotification

// https://github.com/jaydee3/JDStatusBarNotification
class JDViewController: UIViewController {
    
    @IBOutlet weak var animationType: UISegmentedControl!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var indicatorSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "JDStatusBar"
        durationLabel.text = "Duration: \(durationSlider.value)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

extension JDViewController {
    
    @IBAction func slideDuration(sender: AnyObject) {
        
        guard let slider = sender as? UISlider else {
            return
        }
        durationLabel.text = "Duration: \(slider.value)"
    }
    
    @IBAction func pushNotificationButton(sender: AnyObject) {
        
        JDStatusBarNotification.setDefaultStyle{ style -> JDStatusBarStyle! in
            
            style.textColor = UIColor.yellowColor()
            style.barColor = UIColor.blueColor()
//            style.textShadow = nil
//            style.font = nil
//            style.textVerticalPositionAdjustment = 0
            
            style.animationType = JDStatusBarAnimationType(rawValue: self.animationType.selectedSegmentIndex) ?? .None
            
//            style.progressBarColor = UIColor.blueColor()
//            style.progressBarHeight = 10.0
//            style.progressBarPosition = .Top  //.Top //.NavBar//.Center//.Bottom//.Below
            
            return style
        }
        
        let title = titleTextField.text
        let duration = durationSlider.value
        
        switch duration {
        case 0  : JDStatusBarNotification.showWithStatus(title, styleName: "JDStatusBarStyleDefault")
        default : JDStatusBarNotification.showWithStatus(title, dismissAfter: Double(duration) ,styleName: "JDStatusBarStyleDefault")
        }
        
        switch indicatorSwitch.on {
        case true  : JDStatusBarNotification.showActivityIndicator(true, indicatorStyle: .White)
        case false : ()
        }
    }
    
    @IBAction func pushDismissButton(sender: AnyObject) {
        JDStatusBarNotification.dismiss()
    }
    
}