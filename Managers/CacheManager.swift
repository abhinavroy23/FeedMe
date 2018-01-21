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
    
    let imageLocalCache = NSCache<NSString, UIImage>()
    let diskFileManager : MyFileManager = MyFileManager.init()
    
    func getImageFromLocalCache(forUrl url:String, withCompletionHandler completionHandler:(_ image : UIImage)->(), andErrorHandler errorHandler : ()->()){
        if let image = self.imageLocalCache.object(forKey: NSString.init(string: url)){
            completionHandler(image)
            
        }else{
            //Download image if not found in cache
            if let urlObject = URL.init(string: url){
                do{
                    let data = try Data.init(contentsOf: urlObject)
                    if let resultImage = UIImage.init(data: data){
                        self.imageLocalCache.setObject(resultImage, forKey: NSString.init(string: url))
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
    
    func getImageFromPermanentCache(forUrl url:String, withCompletionHandler completionHandler:(_ image : UIImage)->(), andErrorHandler errorHandler : ()->()){
        if let image = self.diskFileManager.loadImageFromFilecache(forKey: url){
            completionHandler(image)
            
        }else{
            //Download image if not found in cache
            if let urlObject = URL.init(string: url){
                do{
                    let data = try Data.init(contentsOf: urlObject)
                    if let resultImage = UIImage.init(data: data){
                        self.diskFileManager.saveImageToFileCache(forKey: url, andImage: resultImage, withCompletionHandler: {
                            completionHandler(resultImage)
                        }, andErrorHandler: {
                            errorHandler()
                        })
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
    
    func clearPermanentCache(){
        self.diskFileManager.clearImageCache()
    }

}
