//
//  FileManager.swift
//  FeedMe
//
//  Created by Abhinav Roy on 18/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

class MyFileManager: NSObject {
    
    static private func getFileURL() -> URL? {
        // construct a URL for a file named 'SearchResult' in the DocumentDirectory
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let archiveURL = urls.last?.appendingPathComponent("SearchResult")
        return archiveURL
    }
    
    static func saveSearchResultsToDisk(searchResult: SearchResult, withCompletionHandler completionHandler : ()->(), andErrorHandler errorHandler:()->()) {
        let success = NSKeyedArchiver.archiveRootObject(searchResult, toFile: (getFileURL()?.path)!)
        if !success {
            errorHandler()
        }else{
            completionHandler()
        }
    }
    
    static func loadSearchResultsFromDisk() -> SearchResult? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: (getFileURL()?.path)!) as? SearchResult
    }

}
