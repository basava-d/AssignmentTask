//
//  ProductNameTableViewCell.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj on 05/08/18.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import UIKit

class ProductNameTableViewCell: UITableViewCell {
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
