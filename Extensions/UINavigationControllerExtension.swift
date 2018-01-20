//
//  UINavigationControllerExtension.swift
//  FeedMe
//
//  Created by Abhinav Roy on 20/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

extension UINavigationController{
    
    func pushViewController(identifier : String, animated : Bool = true){
        self.pushViewController(UIStoryboard.main().instantiateViewController(withIdentifier: identifier), animated: animated)
    }
}
