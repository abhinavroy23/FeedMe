//
//  UrlConstant.swift
//  FeedMe
//
//  Created by Abhinav Roy on 17/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

class UrlConstant: NSObject {

    static var zomatoBaseUrl : String {
        return "https://developers.zomato.com/api/"
    }
    
    static var zomatoApiVersion : String {
        return "2.1"
    }
    
    static var zomationUserkey : String{
        return "d30a6ac118e52fec8c11ee158951d276"
    }
    
    static func getRestrauntsUrlBasedOn(lat : String, long : String) -> String{
        return zomatoBaseUrl+"v"+zomatoApiVersion+"/geocode?lat=\(lat)&lon=\(long)"
    }

}
