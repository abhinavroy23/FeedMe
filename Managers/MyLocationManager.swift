//
//  MyLocationManager.swift
//  FeedMe
//
//  Created by Abhinav Roy on 18/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit
import CoreLocation

class MyLocationManager : NSObject{
    
    static var shared : MyLocationManager = MyLocationManager()
    
    var locationManager:CLLocationManager!
    var completionHandler:((_ lat : String, _ long : String)->())?
    var errorHandler:((_ error : Error)->())?
    
    func determineMyCurrentLocation(withCompletionHandler completionHandler:@escaping (_ lat : String, _ long : String)->(), andErrorHandler errorHandler : @escaping (_ error : Error)->()) {
        
        self.completionHandler = completionHandler
        self.errorHandler = errorHandler
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
}

extension MyLocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.stopUpdatingLocation()
        }
        let userLocation:CLLocation = locations[0] as CLLocation
        if let completion = self.completionHandler{
            completion(String(userLocation.coordinate.latitude),String(userLocation.coordinate.longitude))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let errorHandler = self.errorHandler{
            errorHandler(error)
        }
    }
    
}
