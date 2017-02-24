//
//  TopicScrollViewConfig.swift
//  Science_Plus
//
//  Created by Qiang Chen on 7/16/16.
//  Copyright © 2016 Chem_Plus. All rights reserved.
//

import Foundation
/**Reused Compoment of the topic Scroll View*/
class MyTopicScrollView {
    
    fileprivate struct myStoryBoard {
        static let topicLabelName = "MyTopicLabel"
        static let labelY = 2
        static let labelHeight = 23
        static let widthForAWord = 15
        static let intervalInLabel = 10
        /**to indicate the start postion of the next label*/
        static let labelStart = 10
    }
    
    


    
    static func config(_ scrollView:UIScrollView, topics:[String]){
        
        var nextStart = myStoryBoard.labelStart
        for view in scrollView.subviews{
            view.removeFromSuperview()
        }
        
        
        
        
        for topic in topics {
            let labelView:UIView = Bundle.main.loadNibNamed(myStoryBoard.topicLabelName, owner: nil, options: nil)![0] as! UIView
            
            if let topicLabel = labelView.subviews[0] as? UILabel{
                topicLabel.removeFromSuperview()
                topicLabel.text = topic
                
                let labelWidth = myStoryBoard.widthForAWord*topic.length
                
                topicLabel.frame = CGRect(x: nextStart, y: myStoryBoard.labelY, width: labelWidth, height: myStoryBoard.labelHeight)
                
                scrollView.addSubview(topicLabel)
                
                nextStart += labelWidth + myStoryBoard.intervalInLabel
                
                
                
                
            } else {
                break
            }
            
        }

        scrollView.contentSize.width = CGFloat(nextStart)
    }
    
    
}



    
