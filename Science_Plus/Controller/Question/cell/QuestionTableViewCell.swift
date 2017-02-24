//
//  QuestionTableViewCell.swift
//  Science_Plus
//
//  Created by Mac,Qiang on 16/5/7.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit
/** Table View Cell in QuestionViewController*/
class QuestionTableViewCell: UITableViewCell {
    @IBOutlet var title :UILabel!
    @IBOutlet var upNumber:UILabel!
    @IBOutlet var content:UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var topicScrollView: UIScrollView!{
        didSet{
            topicScrollView.isScrollEnabled = true
        }
    }
    var question : Question? {
        didSet{
            updateUI()
        }
    }

    
    
    
    
    fileprivate func updateUI(){
        
        if let nowQuestion = question{
            
            content.text=nowQuestion.bestAnswer?.content
//            thumbnailImageView.image=UIImage(named: nowQuestion.bestAnswer?.user.img_url ?? SystemConstants.defaultUserImage)
            
            thumbnailImageView.imageFromUrl((nowQuestion.bestAnswer?.user.img_url)!)
            title.text=nowQuestion.title
            upNumber.text = nowQuestion.bestAnswer!.praiseNum.str
            
//            nowQuestion.topics = ["汉字测试" , "汉字测试汉字测试" , "汉字测试汉字测试汉字测试汉字测试" , "汉字测试汉字测试汉字测试汉字测试" , "汉字测试" ,"汉字测试汉字测试"]
            
            
            MyTopicScrollView.config(topicScrollView, topics: nowQuestion.topics)

           
        }
        
        
        
        
    }
}
