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
    
    title = "SPLIT BILL"
    
    pricePerPerson = totalBillAmount/(Double(numberOfRows))
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func viewWillAppear(animated: Bool) {
    var currentTotalBarButtonItem = UIBarButtonItem(title: NSNumberFormatter.localizedStringFromNumber(pricePerPerson, numberStyle: NSNumberFormatterStyle.CurrencyStyle),  style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    
    navigationItem.rightBarButtonItem = currentTotalBarButtonItem
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
      UIView.animateWithDuration(0.5,
        animations: {
          sender.superview?.backgroundColor = Helper.colorFromHexString("#2ecc71")
        }
      )
      
    } else {
      if defaults.boolForKey("darkTheme"){
        UIView.animateWithDuration(0.5,
          animations: {
            sender.superview?.backgroundColor = Helper.colorFromHexString("#7f8c8d")
          }
        )
      } else {
        UIView.animateWithDuration(0.5,
          animations: {
            sender.superview?.backgroundColor = Helper.colorFromHexString("#ecf0f1")
          }
        )
      }
    }
  }
  
  @IBAction func onEditingFinished(sender: AnyObject) {
    self.view.endEditing(true)
  }

}
