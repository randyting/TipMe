//
//  SettingsTableViewController.swift
//  TipMe
//
//  Created by Randy Ting on 8/15/15.
//  Copyright (c) 2015 Randy Ting. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
  
  // MARK: - Constants
  
  let tipPercentages = [0.18, 0.2, 0.22]
  let defaults = NSUserDefaults.standardUserDefaults()
  
  enum SettingsTableViewRow : Int {
    case DefaultTip, DarkTheme, ShowDogeInModal, AnimateDoge, Count

    static let titles = [
      DefaultTip: "Default Tip",
      DarkTheme: "Dark Theme",
      ShowDogeInModal: "Show Doge In Modal",
      AnimateDoge: "Animate Doge"
    ]
    
    func title() -> String {
      if let rowTitle = SettingsTableViewRow.titles[self] {
        return rowTitle
      } else {
        assert(true, "Attempted to access SettingsTableViewRow out of bounds.")
        return "Out of bounds"
      }
    }
    
    static let shouldHideDarkThemeSwitchSettings = [
      DefaultTip: true,
      DarkTheme: false,
      ShowDogeInModal: true,
      AnimateDoge: true
    ]
    
    func shouldHideDarkThemeSwitch() -> Bool {
      if let rowDarkThemeSwitchHidden = SettingsTableViewRow.shouldHideDarkThemeSwitchSettings[self] {
        return rowDarkThemeSwitchHidden
      } else {
        assert(true, "Attempted to access SettingsTableViewRow out of bounds.")
        return true
      }
    }
    
    static let shouldHideTipSelectorSettings = [
      DefaultTip: false,
      DarkTheme: true,
      ShowDogeInModal: true,
      AnimateDoge: true
    ]
    
    func shouldHideTipSelector() -> Bool {
      if let rowTipSelectorHidden = SettingsTableViewRow.shouldHideTipSelectorSettings[self] {
        return rowTipSelectorHidden
      } else {
        assert(true, "Attempted to access SettingsTableViewRow out of bounds.")
        return true
      }
    }
    
  }
  
  // MARK: - Behavior
  
  func tipChanged(sender: UISegmentedControl!){
    defaults.setDouble(tipPercentages[sender.selectedSegmentIndex], forKey: "defaultTip")
  }
  
  func themeChanged(sender: UISwitch!){
    if sender.on {
      defaults.setBool(true, forKey: "darkTheme")
    } else {
      defaults.setBool(false, forKey: "darkTheme")
    }
  }
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Settings"
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table View Data Source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return SettingsTableViewRow.Count.rawValue
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> SettingsTableViewCell {
    let cell: SettingsTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SettingsTableViewCell
    
    let currentRow = SettingsTableViewRow(rawValue: indexPath.row)!
    
    cell.settingNameLabel.text = currentRow.title()
    cell.darkThemeSwitch.hidden = currentRow.shouldHideDarkThemeSwitch()
    cell.defaultTipSelector.hidden = currentRow.shouldHideTipSelector()
    
    cell.darkThemeSwitch.on = defaults.boolForKey("darkTheme")
    cell.darkThemeSwitch.addTarget(self, action: "themeChanged:", forControlEvents: UIControlEvents.ValueChanged)
    
    cell.defaultTipSelector.addTarget(self, action: "tipChanged:", forControlEvents: UIControlEvents.ValueChanged)
    cell.defaultTipSelector.selectedSegmentIndex = find(tipPercentages, defaults.doubleForKey("defaultTip"))!

    return cell
  }
  
  // MARK: - Table View Behavior
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if indexPath.row == SettingsTableViewRow.ShowDogeInModal.rawValue {
      performSegueWithIdentifier("showDogeInModal", sender: self)
      
    }
    if indexPath.row == SettingsTableViewRow.AnimateDoge.rawValue {
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
