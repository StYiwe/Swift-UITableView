//
//  TableView2Cell.swift
//  UITableView
//
//  Created by StYiWe on 2020/9/14.
//  Copyright © 2020 stYiwe. All rights reserved.
//

import UIKit

class TableView2Cell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
