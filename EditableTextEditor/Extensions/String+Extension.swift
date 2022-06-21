//
//  String+Extension.swift
//  editabletextfield
//
//  Created by MacBook on 21/06/2022.
//

import Foundation

extension String{
    /// Words calculation logic inside the sentence
    var calculateWords:Int{
        self.split { !$0.isLetter }.count
    }
}
