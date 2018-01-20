//
//  DataManager.swift
//  FeedMe
//
//  Created by Abhinav Roy on 18/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {
    
    var context : NSManagedObjectContext?
    
    override init() {
        super.init()
        self.context = getCDContext()
    }
    
    func getCDContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return context
    }
    
    func saveSearchResultsToCD(searchResult: SearchResult, withCompletionHandler completionHandler : ()->(), andErrorHandler errorHandler:()->()) {
        if let currentContext = context{
            let searchResultEntity = NSEntityDescription.insertNewObject(forEntityName: "SearchResultEntity", into: currentContext)
            searchResultEntity.setValue(searchResult.link, forKey: "link")
            searchResultEntity.setValue(searchResult.location, forKey: "location")
            searchResultEntity.setValue(searchResult.nearbyRestaurants, forKey: "nearbyRestaurants")
            searchResultEntity.setValue(searchResult.popularity, forKey: "popularity")
            
            do{
                try currentContext.save()
                completionHandler()
            }catch{
                errorHandler()
            }
        }else{
            errorHandler()
        }
    }
    
    func loadSearchResultsFromCD() -> SearchResult? {
        var searchResultCD : NSManagedObject? = nil
        var searchResult : SearchResult?
        if let currentContext = context{
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SearchResultEntity")
            fetchRequest.returnsObjectsAsFaults = false
            do {
                let searchResultCDList = try currentContext.fetch(fetchRequest)
                if(searchResultCDList.count > 0){
                    searchResultCD = searchResultCDList[0]
                    searchResult = SearchResult.init(link: searchResultCD?.value(forKey: "link") as? String, popularity: searchResultCD?.value(forKey: "popularity") as? Popularity, location: searchResultCD?.value(forKey: "location") as? Location, nearbyRestaurants: searchResultCD?.value(forKey: "nearbyRestaurants") as? [NearbyRestaurants])
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        return searchResult
    }

}
