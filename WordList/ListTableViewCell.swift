//
//  ListTableViewCell.swift
//  WordList
//
//  Created by takafumi oosugi on 2016/02/10.
//  Copyright © 2016年 myname. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var englishLabel:UILabel!
    @IBOutlet var japaneseLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
