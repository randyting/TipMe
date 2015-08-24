//
//  ViewController.swift
//  TipMe
//
//  Created by Randy Ting on 8/15/15.
//  Copyright (c) 2015 Randy Ting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
  // MARK: - Storyboard Object
  
  @IBOutlet weak var dollarSignLabel: UILabel!
  @IBOutlet weak var billAmountLabel: UILabel!
  @IBOutlet weak var tipNameLabel: UILabel!
  
  @IBOutlet weak var totalNameLabel: UILabel!
  @IBOutlet weak var borderView: UIView!
  
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var tipControl: UISegmentedControl!
  
  
  // MARK: - Private Variables
  
  var currencySymbol: String = ""
  
  // MARK: - Constants
  
  let tipPercentages = [0.18, 0.2, 0.22]
  let defaults = NSUserDefaults.standardUserDefaults()
  
  // MARK: - Helper
  
  func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
  
  // MARK: - Behavior
  
  @IBAction func onEditingChanged(sender: AnyObject) {
    
    var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
    var billAmount = (billField.text as NSString).doubleValue
    var tip = billAmount * tipPercentage
    var total = billAmount + tip
    
    tipLabel.text = NSNumberFormatter.localizedStringFromNumber(tip as NSNumber, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
    totalLabel.text = NSNumberFormatter.localizedStringFromNumber(total as NSNumber, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
  }
  
  // MARK: - App Lifecycle
  
  func onDidBecomeActive(){
    if defaults.boolForKey("ShouldClearBillAmount"){
      billField.text = ""
    } else {
      billField.text = (defaults.objectForKey("LastBillAmount") as! String)
    }
    
    currencySymbol = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String
    dollarSignLabel.text = currencySymbol
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
      defaults.setBool(false, forKey: "darkTheme")
      defaults.synchronize()
    }
    
    if defaults.objectForKey("defaultTip") == nil {
      defaults.setDouble(0.18, forKey: "defaultTip")
      defaults.synchronize()
    }
    
    tipControl.selectedSegmentIndex = find(tipPercentages, defaults.doubleForKey("defaultTip"))!
    billField.becomeFirstResponder()
    currencySymbol = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String
    
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
    
    switch defaults.boolForKey("darkTheme"){
      case true:
        view.backgroundColor = UIColor.blackColor()
        dollarSignLabel.textColor = UIColor.orangeColor()
        billAmountLabel.textColor = UIColor.orangeColor()
        tipNameLabel.textColor = UIColor.orangeColor()
        totalNameLabel.textColor = UIColor.orangeColor()
        borderView.backgroundColor = UIColor.orangeColor()
        tipLabel.textColor = UIColor.orangeColor()
        billField.textColor = UIColor.orangeColor()
        totalLabel.textColor = UIColor.orangeColor()
        tipControl.tintColor = UIColor.orangeColor()
        billField.backgroundColor = UIColor.blackColor()
        billField.tintColor = UIColor.orangeColor()
        
      case false:
        view.backgroundColor = UIColor.whiteColor()
        dollarSignLabel.textColor = UIColor.blackColor()
        billAmountLabel.textColor = UIColor.blackColor()
        tipNameLabel.textColor = UIColor.blackColor()
        totalNameLabel.textColor = UIColor.blackColor()
        borderView.backgroundColor = UIColor.blackColor()
        tipLabel.textColor = UIColor.blackColor()
        billField.textColor = UIColor.blackColor()
        totalLabel.textColor = UIColor.blackColor()
        tipControl.tintColor = UIColorFromRGB(0x007AFF)
        billField.backgroundColor = UIColor.whiteColor()
        billField.tintColor = UIColor.blackColor()
      default:
        assert(true, "This should never happen")
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

