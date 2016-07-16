//
//  NoticAgreeTableViewCell.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/11.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class NoticAgreeTableViewCell: UITableViewCell {

    @IBOutlet weak var whoUpLabel: UILabel!
    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var numofUpL: UILabel!
    
    @IBOutlet weak var answerL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
