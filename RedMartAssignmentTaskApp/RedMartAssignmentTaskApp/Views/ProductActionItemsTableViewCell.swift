//
//  ProductActionItemsTableViewCell.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj on 05/08/18.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import UIKit

class ProductActionItemsTableViewCell: UITableViewCell {
    @IBOutlet weak var saveToListButton: UIButton!
    
    @IBOutlet weak var addToCartButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
