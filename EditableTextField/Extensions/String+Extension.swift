//
//  String+Extension.swift
//  editabletextfield
//
//  Created by MacBook on 21/06/2022.
//

import Foundation

extension String{
    var calculateWords:Int{
        self.split { !$0.isLetter }.count
    }
}
