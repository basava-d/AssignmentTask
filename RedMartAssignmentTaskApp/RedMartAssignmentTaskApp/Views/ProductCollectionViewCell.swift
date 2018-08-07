//
//  ProductCollectionViewCell.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj D on 03/08/2018.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var productNameLabel: UILabel!
  
  @IBOutlet weak var bgView: UIView!
  @IBOutlet weak var productImageView: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    self.bgView.layer.cornerRadius = 8
//    self.bgView.layer.borderColor = UIColor.red.cgColor
//    self.bgView.layer.borderWidth = 8
    }

}
