//
//  StateButton.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/24.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import UIKit
/**
 状态Button，即点击了一次之后会维持其被点击的状态直到下一次点击
 */
class StateButton: UIButton {
    @IBInspectable
    var imageNotClicked:String = ""
    @IBInspectable
    var imageClicked:String = ""
    

    
    
    
    override var selected: Bool{
        didSet{
            if selected{
                setImage(UIImage(named: imageClicked), forState: .Normal)

            }else{
                setImage(UIImage(named: imageNotClicked), forState: .Normal)
            }
        }
    }
    
    
}