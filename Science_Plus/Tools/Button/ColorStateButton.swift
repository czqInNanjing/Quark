//
//  ColorStateButton.swift
//  Science_Plus
//
//  Created by Mac on 16/6/4.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import UIKit
/**
 状态Button，即点击了一次之后会维持其被点击的状态直到下一次点击
 */
class ColorStateButton: UIButton {
    @IBInspectable
    var colorClicked:UIColor=UIColor()
    @IBInspectable
    var colorNotClicked:UIColor=UIColor()
    @IBInspectable
    var textClicked:String = ""
    @IBInspectable
    var textNotClicked:String = ""
    
    
    
    
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                self.backgroundColor=colorClicked
                self.setTitle(textClicked, for: UIControlState())
            }else{
                self.backgroundColor=colorNotClicked
                self.setTitle(textNotClicked, for: UIControlState())
            }
        }
    }
    
    
}
