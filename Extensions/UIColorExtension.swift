//
//  UIColorExtension.swift
//  FeedMe
//
//  Created by Abhinav Roy on 17/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var appThemeColor : UIColor {
        return UIColor.init(red: 134/255, green: 2/255, blue: 8/255, alpha: 1.0)
    }
    
    convenience init(hex: String) {
        let rgbValue = Utility.intFromHexString(hexStr: hex)
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }

    
}
