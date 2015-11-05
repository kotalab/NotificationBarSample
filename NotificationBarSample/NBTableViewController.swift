//
//  NBTableViewController.swift
//  NotificationBarSample
//
//  Created by kotala tetsuya on 2015/11/05.
//  Copyright © 2015年 kotalab. All rights reserved.
//

import UIKit

class NBTableViewController: UITableViewController {
    
    enum Segue: Int {
        case CWSegue, JDSegue, TSSegue
        
        func toString() -> String {
            switch self {
            case .CWSegue : return "CWStatusBar"
            case .JDSegue : return "JDStatusBar"
            case .TSSegue : return "TSMessage"
            }
        }
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
        return 3
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
