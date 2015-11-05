//
//  NBTableViewController.swift
//  NotificationBarSample
//
//  Created by kotala tetsuya on 2015/11/05.
//  Copyright © 2015年 kotalab. All rights reserved.
//

import UIKit

// via:http://stackoverflow.com/questions/27094878/how-do-i-get-the-count-of-a-swift-enum
// enum which provides a count of its cases
protocol CaseCountable {
    static func countCases() -> Int
    static var caseCount : Int { get }
}
// provide a default implementation to count the cases for Int enums assuming starting at 0 and contiguous
extension CaseCountable where Self : RawRepresentable, Self.RawValue == Int {
    // count the number of cases in the enum
    static func countCases() -> Int {
        // starting at zero, verify whether the enum can be instantiated from the Int and increment until it cannot
        var count = 0
        while let _ = Self(rawValue: count) { count++ }
        return count
    }
}

class NBTableViewController: UITableViewController {
    
    enum Segue: Int, CaseCountable {
        case CWSegue, JDSegue, TSSegue
        
        func toString() -> String {
            switch self {
            case .CWSegue : return "CWStatusBar"
            case .JDSegue : return "JDStatusBar"
            case .TSSegue : return "TSMessage"
            }
        }
        
        static let caseCount = Segue.countCases()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Segue.caseCount
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        switch Segue(rawValue: indexPath.row) {
        case let segue? : cell.textLabel?.text = segue.toString()
        case .None      : ()
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        guard let segue = Segue(rawValue: indexPath.row) else {
            return
        }
        performSegueWithIdentifier(segue.toString(), sender: nil)
    }

}
