//
//  DetailViewController.swift
//  FeedMe
//
//  Created by Abhinav Roy on 21/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class DetailViewController: UIViewController {
    
    var restaurant : Restaurant?
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantLocalityVerbose: UILabel!
    @IBOutlet weak var restaurantRatingBtn: UIButton!
    @IBOutlet weak var restaurantHasOnlineDeliveryBtn: UIImageView!
    @IBOutlet weak var restaurantHasTableBookingBtn: UIImageView!
    @IBOutlet weak var restaurantCuisines: UILabel!
    @IBOutlet weak var restaurantAverageCost: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func getDirectionsAction(_ sender: Any) {
        if let lat = self.restaurant?.location?.latitude, let long = self.restaurant?.location?.longitude{
            
            let latitude:CLLocationDegrees =  Double(lat)!
            let longitude:CLLocationDegrees =  Double(long)!
            
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = restaurant?.name ?? "Restaurant"
            mapItem.openInMaps(launchOptions:options)
        }
    }
}

extension DetailViewController{
    
    func setupData(){
        
        if let restaurant = self.restaurant{
            //Restaurant Image
            let imageUrl = (restaurant.featuredImage ?? "").replacingOccurrences(of: "?output-format=webp", with: "")
            CacheManager.shared.getImageFromPermanentCache(forUrl: imageUrl, withCompletionHandler: { (image) in
                self.restaurantImageView.image = image
            }) {
                self.restaurantImageView.image = nil
            }
            
            //Restaurant name
            if let name = restaurant.name{
                self.restaurantName.text = name
            }
            
            //Restaurant locality verbose
            if let localityVerbose = restaurant.location?.localityVerbose{
                self.restaurantLocalityVerbose.text = localityVerbose
            }
            
            //Restaurant Rating
            if let rating = restaurant.userRating?.aggregateRating{
                self.restaurantRatingBtn.setTitle(rating, for: .normal)
            }
            
            //restaurant rating color
            if let ratingColor = restaurant.userRating?.ratingColor{
                self.restaurantRatingBtn.backgroundColor = UIColor.init(hex: "#\(ratingColor)")
            }else{
                self.restaurantRatingBtn.backgroundColor = UIColor.init(hex: "#008000")
            }
            
            //Restaurant cuisines
            if let cuisines = restaurant.cuisines{
                self.restaurantCuisines.text = cuisines
            }
            
            //Restaurant Average cost for two
            if let cost = restaurant.averageCostForTwo{
               self.restaurantAverageCost.text = "₹ \(cost) for two (approx.)"
            }
            
            //Address
            if let address = restaurant.location?.address{
                self.restaurantAddress.text = address
            }
        }
    }
    
}
