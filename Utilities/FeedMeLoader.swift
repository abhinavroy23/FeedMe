//
//  FeedMeLoader.swift
//  FeedMe
//
//  Created by Abhinav Roy on 21/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//
import UIKit

class FeedMeLoader: NSObject {
    
    public static let shared : FeedMeLoader = FeedMeLoader()
    var loaderView : UIView?
    
    public func startLoader(){
        
        if let appDel = UIApplication.shared.delegate{
            if let appWindow = appDel.window{
                if let actualWindow = appWindow{
                    loaderView = UIView.init(frame: actualWindow.bounds)
                    if let loaderView = loaderView{
                        loaderView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                        
                        let activityIndicator = UIActivityIndicatorView.init(frame : CGRect(x:0,y:0,width:Constant.IS_IPAD ? 80 : 50,height:Constant.IS_IPAD ? 80 : 50))
                        activityIndicator.activityIndicatorViewStyle = .whiteLarge
                        activityIndicator.center = loaderView.center
                        activityIndicator.startAnimating()
                        loaderView.addSubview(activityIndicator)
                        actualWindow.addSubview(loaderView)
                    }
                }
            }
        }
    }
    
    public func stopLoader(){
        if let loaderView = loaderView{
            loaderView.removeFromSuperview()
        }
    }
}
