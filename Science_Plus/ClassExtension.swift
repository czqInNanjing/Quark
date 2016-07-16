//
//  ClassExtension.swift
//  Science_Plus
//
//  Created by Qiang Chen on 7/15/16.
//  Copyright © 2016 Chem_Plus. All rights reserved.
//

import Foundation

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