//
//  SessionServiceManager.swift
//  FeedMe
//
//  Created by Abhinav Roy on 17/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import Foundation
import UIKit

enum enRequestContentType{
    case eRequestNoneType
    case eRequestJsonType
    case eRequestXWWWFormType
    case eRequestTextPlainType
}

class SessionServiceManager : NSObject {
    
    let kTimeOut = 150
    static let sharedSessionServiceManger : SessionServiceManager = SessionServiceManager()
    
    func sendRequest(forUrl url:String, dataToSend inJsonDic:AnyObject?, cookies isCookiesRequired : Bool, requestType inRequestType : String, contentType inContentType : enRequestContentType, headers inHeaderDic : [String : String] ,withCompletionHandler completionHandler:@escaping (_ responseData : Data?)->(), andErrorHandler errorHandler:@escaping (_ error: Error?)->()){
        
        //url session
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        
        //make data task Url
        let dataTaskUrl : URL? = URL.init(string: url)
        
        //Request
        guard let url = dataTaskUrl else{
            errorHandler(nil)
            return
        }
        
        //Initiatize request
        let dataTaskRequest : NSMutableURLRequest = NSMutableURLRequest.init(url: url, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: TimeInterval(kTimeOut))
        
        //Add cookies if required
        if isCookiesRequired {
            let cookieUrl : NSURL = NSURL.init(string: "\(String(describing: url.scheme))://\(String(describing: url.host))")!
            let cookieArray : [HTTPCookie] = HTTPCookieStorage.shared.cookies(for: cookieUrl as URL)!
            let cookiesDic : Dictionary? = HTTPCookie.requestHeaderFields(with: cookieArray)
            if(cookiesDic != nil){
                if let cookie = cookiesDic?["Cookie"]{
                    dataTaskRequest.addValue(cookie, forHTTPHeaderField: "Cookie")
                }
            }
        }
        
        //set content type
        let contentType : String?
        switch inContentType {
        case .eRequestJsonType:
            contentType = "application/JSON"
            break
            
        case .eRequestXWWWFormType:
            contentType = "application/x-www-form-urlencoded"
            break
            
        case .eRequestTextPlainType:
            contentType = "text/plain"
            break
        case .eRequestNoneType:
            contentType = ""
            break
        }
        if (contentType?.lengthOfBytes(using: String.Encoding.utf8))! > 0 {
            dataTaskRequest.addValue(contentType!, forHTTPHeaderField: "Content-Type")
        }
        
        //set request method
        dataTaskRequest.httpMethod = inRequestType
        
        //Additional header dic
        for (key,value) in inHeaderDic {
            dataTaskRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        //serialize body
        if let inJsonDic = inJsonDic {
            do {
                if(inContentType == .eRequestJsonType){
                    let jsonData : Data = try JSONSerialization.data(withJSONObject: inJsonDic as AnyObject, options: JSONSerialization.WritingOptions.prettyPrinted)
                    dataTaskRequest.httpBody = jsonData
                }else{
                    dataTaskRequest.httpBody = (inJsonDic as! String).data(using: .utf8)
                }
            } catch  {
                print(error)
            }
        }
        
        //Service hit using data task
        let myDataTask = defaultSession.dataTask(with: dataTaskRequest as URLRequest, completionHandler: { (data, response, err) in
            
            if (err != nil){
                errorHandler(err)
            }else{
                completionHandler(data)
            }
        })
        myDataTask.resume()
    }
}
