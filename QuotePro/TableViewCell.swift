//
//  TableViewCell.swift
//  QuotePro
//
//  Created by Hamza Lakhani on 2016-12-07.
//  Copyright © 2016 Hamza Lakhani. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    // MARK:  Properties
    
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var quoteText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
