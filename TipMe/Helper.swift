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
    
    let darkBackgroundColor = colorFromHexString("#7f8c8d")
    let darkTintColor = colorFromHexString("#ecf0f1")
    let darkSecondaryColor = colorFromHexString("#95a5a6")
    
    UILabel.appearance().textColor = darkTintColor
    UITextField.appearance().textColor = darkTintColor
    UITextField.appearance().tintColor = darkTintColor
    UITextField.appearance().backgroundColor = darkBackgroundColor
    UISegmentedControl.appearance().tintColor = darkTintColor
    UITableView.appearance().backgroundColor = darkBackgroundColor
    UITableViewCell.appearance().backgroundColor = darkBackgroundColor
    BackgroundUIView.appearance().backgroundColor = darkBackgroundColor
    DividerUIView.appearance().backgroundColor = darkTintColor
    UINavigationBar.appearance().tintColor = darkSecondaryColor
    UINavigationBar.appearance().barTintColor = darkTintColor
    UISwitch.appearance().onTintColor = darkSecondaryColor
  }
  
  class func setLightThemeColors() {
    
    let lightBackgroundColor = colorFromHexString("#ecf0f1")
    let lightTintColor = colorFromHexString("#34495e")
    let lightSecondaryColor = colorFromHexString("#f1c40f")
    
    UILabel.appearance().textColor = lightTintColor
    UITextField.appearance().textColor = lightTintColor
    UITextField.appearance().tintColor = lightTintColor
    UITextField.appearance().backgroundColor = lightBackgroundColor
    UISegmentedControl.appearance().tintColor = lightTintColor
    UITableView.appearance().backgroundColor = lightBackgroundColor
    UITableViewCell.appearance().backgroundColor = lightBackgroundColor
    BackgroundUIView.appearance().backgroundColor = lightBackgroundColor
    DividerUIView.appearance().backgroundColor = lightTintColor
    UINavigationBar.appearance().tintColor = lightBackgroundColor
    UINavigationBar.appearance().barTintColor = lightSecondaryColor
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
  
  class func colorFromHexString(hexString: String) -> UIColor {
    var rgbValue: UInt32 = 0
    let scanner = NSScanner(string: hexString)
    scanner.scanLocation = 1
    scanner.scanHexInt(&rgbValue)
    return UIColor(
      red: CGFloat((rgbValue >> 16) & 0xff) / 255,
      green: CGFloat((rgbValue >> 08) & 0xff) / 255,
      blue: CGFloat((rgbValue >> 00) & 0xff) / 255,
      alpha: 1.0)
  }
  
}
