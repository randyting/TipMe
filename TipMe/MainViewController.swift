//
//  ViewController.swift
//  TipMe
//
//  Created by Randy Ting on 8/15/15.
//  Copyright (c) 2015 Randy Ting. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
 
  // MARK: - Storyboard Objects
  
  @IBOutlet weak var dollarSignLabel: UILabel!
  @IBOutlet weak var billAmountLabel: UILabel!
  @IBOutlet weak var tipNameLabel: UILabel!
  
  @IBOutlet weak var totalNameLabel: UILabel!
  @IBOutlet weak var borderView: UIView!
  
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var tipControl: UISegmentedControl!
  
  @IBOutlet weak var numberOfPeopleLabel: UILabel!
  @IBOutlet weak var personOrPeopleLabel: UILabel!
  @IBOutlet weak var peopleStepper: UIStepper!
  
  // MARK: - Constants
  
  let tipPercentages = [0.18, 0.2, 0.22]
  let defaults = NSUserDefaults.standardUserDefaults()
  
  // MARK: - Private Variables
  
  private var billTotal = 0.0
   
  // MARK: - Behavior
  
  @IBAction func onEditingChanged(sender: AnyObject) {
    
    var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
    var billAmount = (billField.text as NSString).doubleValue
    var tip = billAmount * tipPercentage
    var total = billAmount + tip
    billTotal = total
    
    tipLabel.text = NSNumberFormatter.localizedStringFromNumber(tip, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
    totalLabel.text = NSNumberFormatter.localizedStringFromNumber(total, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
  }
  
  @IBAction func onNumberOfPeopleChanged(sender: AnyObject) {
    numberOfPeopleLabel.text = String(format: "%i", Int((sender as! UIStepper).value))
    if peopleStepper.value > 1.0 {
      personOrPeopleLabel.text = "People"
    } else {
      personOrPeopleLabel.text = "Person"
    }
  }
  
  // MARK: - App Lifecycle
  
  func onDidBecomeActive(){
    if defaults.boolForKey("ShouldClearBillAmount"){
      billField.text = ""
    } else {
      billField.text = (defaults.objectForKey("LastBillAmount") as! String)
    }
    
    dollarSignLabel.text = (NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String)
    onEditingChanged(self)
  }
  
  func onDidEnterBackground(){
    defaults.setObject(billField.text, forKey: "LastBillAmount")
  }
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "TipMe"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
    
    if defaults.objectForKey("currentTip") == nil {
      defaults.setDouble(0.18, forKey: "currentTip")
    }
    
    if defaults.objectForKey("darkTheme") == nil {
      defaults.setBool(false, forKey: "darkTheme")
    }
    
    if defaults.objectForKey("defaultTip") == nil {
      defaults.setDouble(0.18, forKey: "defaultTip")
    }
    
    defaults.synchronize()
    
    if defaults.boolForKey("darkTheme"){
      Helper.setDarkThemeColors()
    } else {
      Helper.setLightThemeColors()
    }
    
    Helper.resetViews()
    billField.becomeFirstResponder()
    tipControl.selectedSegmentIndex = find(tipPercentages, defaults.doubleForKey("defaultTip"))!
    dollarSignLabel.text = (NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String)
    
    // Listen for app background/foreground transitions
    NSNotificationCenter.defaultCenter().addObserver(
      self,
      selector: "onDidBecomeActive",
      name: UIApplicationDidBecomeActiveNotification,
      object: nil)
    
    NSNotificationCenter.defaultCenter().addObserver(
      self,
      selector: "onDidEnterBackground",
      name: UIApplicationDidEnterBackgroundNotification,
      object: nil)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tipControl.selectedSegmentIndex = find(tipPercentages, defaults.doubleForKey("defaultTip"))!
    onEditingChanged(self)

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "splitCheck" {
      if let destinationViewController = (segue.destinationViewController as? SplitCheckTableViewController) {
        destinationViewController.numberOfRows = Int(peopleStepper.value)
        destinationViewController.totalBillAmount = billTotal
      }
      
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  }

}

