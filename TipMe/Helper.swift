//
//  Helper.swift
//  TipMe
//
//  Created by Randy Ting on 8/25/15.
//  Copyright (c) 2015 Randy Ting. All rights reserved.
//

import UIKit

class Helper: NSObject {
  
  class func setDarkThemeColors() {
    UILabel.appearance().textColor = UIColor.orangeColor()
    UITextField.appearance().textColor = UIColor.orangeColor()
    UITextField.appearance().tintColor = UIColor.orangeColor()
    UITextField.appearance().backgroundColor = UIColor.blackColor()
    UISegmentedControl.appearance().tintColor = UIColor.orangeColor()
    UITableView.appearance().backgroundColor = UIColor.blackColor()
    UITableViewCell.appearance().backgroundColor = UIColor.blackColor()
    BackgroundUIView.appearance().backgroundColor = UIColor.blackColor()
    DividerUIView.appearance().backgroundColor = UIColor.orangeColor()
    UINavigationBar.appearance().tintColor = UIColor.grayColor()
    UINavigationBar.appearance().barTintColor = UIColor.orangeColor()
    UISwitch.appearance().onTintColor = UIColor.grayColor()
  }
  
  class func setLightThemeColors() {
    UILabel.appearance().textColor = UIColor.blackColor()
    UITextField.appearance().textColor = UIColor.blackColor()
    UITextField.appearance().tintColor = UIColor.blackColor()
    UITextField.appearance().backgroundColor = UIColor.whiteColor()
    UISegmentedControl.appearance().tintColor = UIColor.blackColor()
    UITableView.appearance().backgroundColor = UIColor.whiteColor()
    UITableViewCell.appearance().backgroundColor = UIColor.whiteColor()
    BackgroundUIView.appearance().backgroundColor = UIColor.whiteColor()
    DividerUIView.appearance().backgroundColor = UIColor.blackColor()
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    UINavigationBar.appearance().barTintColor = UIColor.grayColor()
  }
  
  class func resetViews() {
    let windows = UIApplication.sharedApplication().windows as! [UIWindow]
    for window in windows {
      let subviews = window.subviews as! [UIView]
      for v in subviews {
        v.removeFromSuperview()
        window.addSubview(v)
      }
    }
  }
  
}
