//
//  UIStoryboardExtension.swift
//  FeedMe
//
//  Created by Abhinav Roy on 20/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

extension UIStoryboard{
    
    class public func main() -> UIStoryboard {
        return self.init(name: "Main", bundle: nil)
    }
    
}
