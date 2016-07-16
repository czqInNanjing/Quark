//
//  ClassExtension.swift
//  Science_Plus
//
//  Created by Qiang Chen on 7/15/16.
//  Copyright © 2016 Chem_Plus. All rights reserved.
//

import Foundation
//测试Auto Lauout Constraints使用，会输出有效的信息，此时只需要给Constraints 唯一的 id ， 就可以输出有效的信息
extension NSLayoutConstraint {
    
    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
}

extension UIView {
    @IBInspectable
    public var myCornerRadius: CGFloat{
        set {
            layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
        get {
            return layer.cornerRadius
        }
    }
}
extension String {
    var length: Int {
        return characters.count
    }
}

extension Int {
    /**convenient transform from int to string*/
    var str:String {
        return String(self)
    }
}