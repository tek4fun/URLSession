//
//  CustomeCell.swift
//  Session
//
//  Created by techmaster on 4/4/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import UIKit

class CustomeCell: UITableViewCell {

    @IBOutlet weak var txt_Name: UILabel!
    @IBOutlet weak var txt_District: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
