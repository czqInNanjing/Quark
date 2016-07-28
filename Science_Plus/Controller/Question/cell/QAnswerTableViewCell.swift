//
//  QAnswerTableViewCell.swift
//  Science_Plus
//
//  Created by Mac on 16/5/8.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit
/**问题详情列表Cell，指向每一个答案*/
class QAnswerTableViewCell: UITableViewCell {
    @IBOutlet var name :UILabel!
    @IBOutlet var introduction:UILabel!
    @IBOutlet var upNumber:UILabel!
    @IBOutlet var content:UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    /**answer ID , 用于跳转时传递*/
    var answerID :Int?
    
    var answer:Answer?{
        didSet{
            updateUI()
            answerID = answer?.id
        }
    }
    
    private func updateUI(){
        name.text=answer?.user.name
        introduction.text=answer?.user.introduction
        content.text=answer?.content
        thumbnailImageView.image=UIImage(named: answer?.user.img_url ?? SystemConstants.defaultUserImage)
        upNumber.text = "\(answer?.praiseNum ?? 0)"
        
    }
    
    
    
    
}
