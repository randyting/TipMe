//
//  SplitCheckTableViewCell.swift
//  TipMe
//
//  Created by Randy Ting on 8/25/15.
//  Copyright (c) 2015 Randy Ting. All rights reserved.
//

import UIKit

class SplitCheckTableViewCell: UITableViewCell {
  
  @IBOutlet weak var amountReceivedTextField: UITextField!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
