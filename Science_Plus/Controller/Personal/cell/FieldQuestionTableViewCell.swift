//
//  FieldQuestionTableViewCell.swift
//  Science_Plus
//
//  Created by Mac on 16/7/24.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class FieldQuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var answerContent1: UILabel!
    @IBOutlet weak var numberOfUp1: UILabel!
    @IBOutlet weak var answerImageView1: UIImageView!
    @IBOutlet weak var answerContent2: UILabel!
    @IBOutlet weak var numberOfUp2: UILabel!
    @IBOutlet weak var answerImageView2: UIImageView!
    @IBOutlet weak var answerContent3: UILabel!
    @IBOutlet weak var numberOfUp3: UILabel!
    @IBOutlet weak var answerImageView3: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
