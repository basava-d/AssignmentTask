//
//  CustomActivityIndicatorView.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj D on 06/08/2018.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import Foundation
import UIKit

class CustomActivityIndicatorView{
  
  
  static let sharedInstance : CustomActivityIndicatorView = CustomActivityIndicatorView()
  var activityIndicator: UIActivityIndicatorView?
  private init(){
    
  }
  
  func showActivityIndicatorView(_ view: UIViewController)  {
    DispatchQueue.main.async {
      
      if self.activityIndicator != nil {
        self.activityIndicator?.removeFromSuperview()
      }
      view.view.isUserInteractionEnabled = false
      view.isEditing = false
      self.activityIndicator = UIActivityIndicatorView()
      self.activityIndicator?.backgroundColor = UIColor.lightGray
      self.activityIndicator?.layer.cornerRadius = 10
      self.activityIndicator?.frame = CGRect(x: 0, y: 0, width: 100.0, height: 100.0)
      self.activityIndicator?.center = view.view.center
      self.activityIndicator?.hidesWhenStopped = true
      self.activityIndicator?.activityIndicatorViewStyle =
        UIActivityIndicatorViewStyle.whiteLarge
      view.view.addSubview(self.activityIndicator!)
      self.activityIndicator?.startAnimating()
    }
    
  }
  
  
  func removeActivityIndicatorView(_ view: UIViewController)  {
    DispatchQueue.main.async {
      
      view.view.isUserInteractionEnabled = true
      view.isEditing = true
      if self.activityIndicator != nil {
        self.activityIndicator?.removeFromSuperview()
      }
    }
  }
}
