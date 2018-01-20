//
//  CacheManager.swift
//  FeedMe
//
//  Created by Abhinav Roy on 21/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

class CacheManager: NSObject {
    
    static var shared : CacheManager = CacheManager()
    let imageCache = NSCache<NSString, UIImage>()
    
    func getImage(forUrl url:String, withCompletionHandler completionHandler:(_ image : UIImage)->(), andErrorHandler errorHandler : ()->()){
        if let image = self.imageCache.object(forKey: NSString.init(string: url)){
            completionHandler(image)
            
        }else{
            //Download image if not found in cache
            if let urlObject = URL.init(string: url){
                do{
                    let data = try Data.init(contentsOf: urlObject)
                    if let resultImage = UIImage.init(data: data){
                        self.imageCache.setObject(resultImage, forKey: NSString.init(string: url))
                        completionHandler(resultImage)
                    }else{
                        errorHandler()
                    }
                }catch{
                    errorHandler()
                }
            }else{
                errorHandler()
            }
        }
    }

}
