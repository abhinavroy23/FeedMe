//
//  ViewController.swift
//  FeedMe
//
//  Created by Abhinav Roy on 17/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var searchResults : SearchResult?
    var dataManager : DataManager = DataManager.init()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        fetchSearchResults()
    }

}

//MARK: Fetching Search results
extension ViewController{
    
    func fetchSearchResults(){
        
        if let searchResults = dataManager.loadSearchResultsFromCD(){
            debugPrint("MODEL FETCHED FROM STORAGE")
            self.searchResults = searchResults
        }else{
            if CLLocationManager.locationServicesEnabled() {
                getLocationAndFetchDataFromServer()
            }else{
                Utility.showError(withMessage: Constant.ERROR_LOCATION_DISABLED, onViewController: self)
                fetchDataForDummyLocation()
            }
        }
    }
    
    func getLocationAndFetchDataFromServer(){
        MyLocationManager.shared.determineMyCurrentLocation(withCompletionHandler: { [unowned self] (lat, long) in
            self.fetchFromServerAndStore(forLat: lat, andLong: long)
            }, andErrorHandler: { (error) in
                Utility.showError(withMessage: Constant.ERROR_IN_FETCHING_LOCATION, onViewController: self)
                self.fetchDataForDummyLocation()
        })
    }
    
    func fetchDataForDummyLocation(){
        Utility.showError(withMessage: Constant.ERROR_FETCHING_DUMMY_DATA, onViewController: self)
        self.fetchFromServerAndStore(forLat: "28.631451", andLong: "77.216667")
    }
    
    func fetchFromServerAndStore(forLat lat:String, andLong long:String){
        hitServiceToFetchNearbyRestaurants(forLat: lat, andLong: long, withCompletionHandler: {
            if let searchResult = self.searchResults{
                self.dataManager.saveSearchResultsToCD(searchResult: searchResult, withCompletionHandler: {
                     debugPrint("MODEL STORED IN STORAGE")
                }, andErrorHandler: {
                    debugPrint("ERROR")
                })
            }else{
                debugPrint("ERROR")
            }
            
        }) { (error) in
            debugPrint("ERROR : \(error)")
        }
    }
    
    func hitServiceToFetchNearbyRestaurants(forLat lat : String, andLong long:String, withCompletionHandler completion : @escaping ()->(), andErrorHandler errorHandler:@escaping (_ error : Error)->()){
        
        let headerDic : [String : String] = [
            "user-key" : UrlConstant.zomationUserkey
        ]
        let urlString = UrlConstant.getRestrauntsUrlBasedOn(lat: lat, long: long)
        
        SessionServiceManager.sharedSessionServiceManger.sendRequest(forUrl: urlString, dataToSend: nil, cookies: false, requestType: "GET", contentType: .eRequestJsonType, headers: headerDic , withCompletionHandler: { [unowned self] (data) in
            do{
                self.searchResults = try JSONDecoder().decode(SearchResult.self, from: data!)
                completion()
            }catch{
                errorHandler(error)
            }
        }) { (error) in
            errorHandler(error!)
        }
    }
    
}

