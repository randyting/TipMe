//
//  SettingsTableViewCell.swift
//  TipMe
//
//  Created by Randy Ting on 8/15/15.
//  Copyright (c) 2015 Randy Ting. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
  
  // MARK: - Storyboard Objects
  
  @IBOutlet weak var settingNameLabel: UILabel!
  @IBOutlet weak var defaultTipSelector: UISegmentedControl!
  @IBOutlet weak var darkThemeSwitch: UISwitch!
  
  // MARK: - Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  // MARK: - Cell Appearance
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
}
