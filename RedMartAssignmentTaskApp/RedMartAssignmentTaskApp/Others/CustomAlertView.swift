//
//  CustomAlertView.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj D on 06/08/2018.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import Foundation
import UIKit

class CustomAlertView{
  
  static let sharedInstance = CustomAlertView()
  
  private init(){
    
  }
  
  func displayAlert(target : UIViewController, title : String?, errorMessage: String? ,completionHandler:@escaping (Int?) -> Void) {
    
    let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: UIAlertControllerStyle.alert)
    
    let OkAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
      completionHandler(1)
    }
    alert.addAction(OkAction)
    
    target.present(alert, animated: true, completion: nil)
  }
  
}
