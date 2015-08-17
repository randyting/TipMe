//
//  SettingsTableViewController.swift
//  TipMe
//
//  Created by Randy Ting on 8/15/15.
//  Copyright (c) 2015 Randy Ting. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let tipPercentages = [0.18, 0.2, 0.22]
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    func tipChanged(sender: UISegmentedControl!){
        switch sender.selectedSegmentIndex {
            case 0:
                defaults.setDouble(0.18, forKey: "defaultTip")
                println("Selected 18% as default tip amount")
            case 1:
                defaults.setDouble(0.2, forKey: "defaultTip")
                println("Selected 20% as default tip amount")
            case 2:
                defaults.setDouble(0.22, forKey: "defaultTip")
                println("Selected 22% as default tip amount")
            default:
                assert(true, "Attempted to access default tip amount out of bounds!")
        }
    }
    
    func themeChanged(sender: UISwitch!){
        if sender.on {
            defaults.setBool(true, forKey: "darkTheme")
        } else {
            defaults.setBool(false, forKey: "darkTheme")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> SettingsTableViewCell {
        let cell: SettingsTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SettingsTableViewCell

        switch indexPath.row {
        case 0:
            cell.settingNameLabel.text = "Default Tip"
            cell.darkThemeSwitch.hidden = true
            cell.defaultTipSelector.addTarget(self, action: "tipChanged:", forControlEvents: UIControlEvents.ValueChanged)
            cell.defaultTipSelector.selectedSegmentIndex = find(tipPercentages, defaults.doubleForKey("defaultTip"))!
        case 1:
            cell.settingNameLabel.text = "Dark Theme"
            cell.defaultTipSelector.hidden = true
            cell.darkThemeSwitch.on = defaults.boolForKey("darkTheme")
            cell.darkThemeSwitch.addTarget(self, action: "themeChanged:", forControlEvents: UIControlEvents.ValueChanged)
        case 2:
            cell.darkThemeSwitch.hidden = true
            cell.defaultTipSelector.hidden = true
            cell.settingNameLabel.text = "Show Doge in Modal"
        case 3:
            cell.darkThemeSwitch.hidden = true
            cell.defaultTipSelector.hidden = true
            cell.settingNameLabel.text = "Animate Doge"
            
        default:
            assert(true, "Tried to access row that doesn't exist")
            
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 2 {
            performSegueWithIdentifier("showDogeInModal", sender: self)
            
        }
        if indexPath.row == 3 {
            performSegueWithIdentifier("animateDoge", sender: self)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
