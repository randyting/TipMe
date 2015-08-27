//
//  SplitCheckTableViewController.swift
//  TipMe
//
//  Created by Randy Ting on 8/25/15.
//  Copyright (c) 2015 Randy Ting. All rights reserved.
//

import UIKit

class SplitCheckTableViewController: UITableViewController {
  
  // MARK: - Instance Variables
  
  var numberOfRows: Int!
  var totalBillAmount: Double!
  var pricePerPerson: Double!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Split Bill"
    
    pricePerPerson = totalBillAmount/(Double(numberOfRows))
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(animated: Bool) {
    var currentTotalBarButtonItem = UIBarButtonItem(title: NSNumberFormatter.localizedStringFromNumber(pricePerPerson, numberStyle: NSNumberFormatterStyle.CurrencyStyle),  style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    
    navigationItem.rightBarButtonItem = currentTotalBarButtonItem
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return numberOfRows
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> SplitCheckTableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SplitCheckTableViewCell
    
    
    cell.amountReceivedTextField.addTarget(self, action: "onAmountEntered:", forControlEvents: UIControlEvents.AllEditingEvents)
    
    return cell
  }
  
  // MARK: - Behavior
  
  func onAmountEntered(sender: UITextField) {
      let defaults = NSUserDefaults.standardUserDefaults()
    
    if (sender.text as NSString).doubleValue >= pricePerPerson {
      sender.superview?.backgroundColor = UIColor.greenColor()
    } else {
      if defaults.boolForKey("darkTheme"){
        sender.superview?.backgroundColor = UIColor.blackColor()
      } else {
        sender.superview?.backgroundColor = UIColor.whiteColor()
      }
    }
  }
  
  @IBAction func onEditingFinished(sender: AnyObject) {
    self.view.endEditing(true)
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
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  }
  */
  
}
