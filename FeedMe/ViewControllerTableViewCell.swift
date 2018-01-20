//
//  ViewControllerTableViewCell.swift
//  FeedMe
//
//  Created by Abhinav Roy on 21/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    @objc dynamic var restaurant : Restaurant? = nil

    var restaurantImageUrl : String = ""
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantCuisine: UILabel!
    @IBOutlet weak var restaurantCostForTwo: UILabel!
    @IBOutlet weak var restautarantOnlineDeliveryBtn: UIButton!
    @IBOutlet weak var restaurantTableBookingBtn: UIButton!
    @IBOutlet weak var restaurantRating: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addObserver(self, forKeyPath: #keyPath(ViewControllerTableViewCell.restaurant), options: [.old, .new], context: nil)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(ViewControllerTableViewCell.restaurant) {
            self.restaurantName.text = restaurant?.name
            self.restaurantCuisine.text = restaurant?.cuisines
            self.restaurantCostForTwo.text = "₹ \(restaurant?.averageCostForTwo ?? 0) for two persons"
            self.restaurantRating.setTitle(restaurant?.userRating?.aggregateRating  ?? "", for: .normal)
            self.restaurantRating.backgroundColor = UIColor.init(hex: "#\(restaurant?.userRating?.ratingColor ?? "#ffffff")")
            if(restaurant?.hasOnlineDelivery == 1){
                self.restautarantOnlineDeliveryBtn.setImage(#imageLiteral(resourceName: "check"), for: .normal)
            }else{
                self.restautarantOnlineDeliveryBtn.setImage(#imageLiteral(resourceName: "cross"), for: .normal)
            }
            if(restaurant?.hasTableBooking == 1){
                self.restaurantTableBookingBtn.setImage(#imageLiteral(resourceName: "check"), for: .normal)
            }else{
                self.restaurantTableBookingBtn.setImage(#imageLiteral(resourceName: "cross"), for: .normal)
            }
            CacheManager.shared.getImage(forUrl: restaurant?.thumb ?? "", withCompletionHandler: { (image) in
                self.restaurantImage.image = image
            }, andErrorHandler: {
                self.restaurantImage.image = nil
            })
        }
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: #keyPath(ViewControllerTableViewCell.restaurant))
    }
    
}
