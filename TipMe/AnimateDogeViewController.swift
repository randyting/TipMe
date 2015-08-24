//
//  AnimateDogeViewController.swift
//  TipMe
//
//  Created by Randy Ting on 8/16/15.
//  Copyright (c) 2015 Randy Ting. All rights reserved.
//

import UIKit

class AnimateDogeViewController: UIViewController {
  
  @IBOutlet weak var animationImage1: UIImageView!
  @IBOutlet weak var animationImage2: UIImageView!
  @IBOutlet weak var animationImage3: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    animationImage1.alpha = 1
    animationImage2.alpha = 0
    animationImage3.alpha = 0
    
    
    
    UIView.animateWithDuration(3, animations: {
      self.animationImage1.alpha = 0
      self.animationImage2.alpha = 1
      },
      completion: {
        (value: Bool) in
        UIView.animateWithDuration(3, animations: {
          self.animationImage2.alpha = 0
          self.animationImage3.alpha = 1
        })
    })
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
