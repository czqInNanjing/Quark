//
//  StateLabel.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/24.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class StateLabel: UILabel {
    @IBInspectable
    var textNotClicked:String = ""
    @IBInspectable
    var textClicked:String = ""
    
    override var enabled: Bool{
        didSet{
            if enabled {
                text = textClicked
                
            }else{
                text = textNotClicked
            }
        }
    }
    
//    var selected:Bool = false {
//        didSet{
//            if selected {
//                text = textClicked
//            }else{
//                text = textNotClicked
//            }
//        }
//    }
    
    
    
    
    
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
