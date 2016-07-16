//
//  CommentTableViewCell.swift
//  Science_Plus
//
//  Created by Mac on 16/5/15.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet var name :UILabel!
    @IBOutlet var time:UILabel!
    @IBOutlet var content:UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    

    var comment:Comment? {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        // TODO
        if let comment = self.comment{
            name.text = comment.replyerName
            time.text = comment.createTime
            content.text = comment.content
            
        }
        
        
//        cell.name.text="蒋易成"
//        cell.time.text="20:30"
//        cell.content.text="王奶奶家有20只鸡"
//        cell.thumbnailImageView.image=UIImage(named: "restaurant.jpg")
    }
    

}
