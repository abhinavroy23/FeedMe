//
//  NearbyRestaurants.swift
//
//  Created by Abhinav Roy on 18/01/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class NearbyRestaurants : NSObject,NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let restaurant = "restaurant"
    }

    // MARK: Properties
    public var restaurant: Restaurant?
    
    init(restaurant: Restaurant?){
        self.restaurant = restaurant
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.restaurant = aDecoder.decodeObject(forKey: SerializationKeys.restaurant) as? Restaurant
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(restaurant, forKey: SerializationKeys.restaurant)
    }
}

extension NearbyRestaurants : Decodable{
    
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    enum NearbyRestaurantsSerializationKeys : String,CodingKey {
        case restaurant = "restaurant"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NearbyRestaurantsSerializationKeys.self)
        
        let restaurant = try container.decodeIfPresent(Restaurant.self, forKey: .restaurant)
        self.init(restaurant: restaurant)
    }
    
}


