//
//  Restaurant.swift
//
//  Created by Abhinav Roy on 18/01/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Restaurant : NSObject,NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let priceRange = "price_range"
        static let featuredImage = "featured_image"
        static let photosUrl = "photos_url"
        static let name = "name"
        static let cuisines = "cuisines"
        static let zomatoEvents = "zomato_events"
        static let switchToOrderMenu = "switch_to_order_menu"
        static let hasOnlineDelivery = "has_online_delivery"
        static let averageCostForTwo = "average_cost_for_two"
        static let hasTableBooking = "has_table_booking"
        static let isDeliveringNow = "is_delivering_now"
        static let apikey = "apikey"
        static let location = "location"
        static let deeplink = "deeplink"
        static let id = "id"
        static let currency = "currency"
        static let thumb = "thumb"
        static let userRating = "user_rating"
        static let r = "R"
        static let menuUrl = "menu_url"
        static let offers = "offers"
        static let url = "url"
        static let eventsUrl = "events_url"
    }
    
    // MARK: Properties
    public var priceRange: Int?
    public var featuredImage: String?
    public var photosUrl: String?
    public var name: String?
    public var cuisines: String?
    public var zomatoEvents: [ZomatoEvents]?
    public var switchToOrderMenu: Int?
    public var hasOnlineDelivery: Int?
    public var averageCostForTwo: Int?
    public var hasTableBooking: Int?
    public var isDeliveringNow: Int?
    public var apikey: String?
    public var location: Location?
    public var deeplink: String?
    public var id: String?
    public var currency: String?
    public var thumb: String?
    public var userRating: UserRating?
    public var r: R?
    public var menuUrl: String?
    public var url: String?
    public var eventsUrl: String?
    
    init(priceRange: Int?, featuredImage: String?, photosUrl: String?, name: String?, cuisines: String?, zomatoEvents: [ZomatoEvents]?, switchToOrderMenu: Int?, hasOnlineDelivery: Int?, averageCostForTwo: Int?, hasTableBooking: Int?, isDeliveringNow: Int?, apikey: String?, location: Location?, deeplink: String?, id: String?, currency: String?, thumb: String?, userRating: UserRating?, r: R?, menuUrl: String?, url: String?, eventsUrl: String?){
        
        self.priceRange = priceRange
        self.featuredImage = featuredImage
        self.photosUrl = photosUrl
        self.name = name
        self.cuisines = cuisines
        self.zomatoEvents = zomatoEvents
        self.switchToOrderMenu = switchToOrderMenu
        self.hasOnlineDelivery = hasOnlineDelivery
        self.averageCostForTwo = averageCostForTwo
        self.hasTableBooking = hasTableBooking
        self.isDeliveringNow = isDeliveringNow
        self.apikey = apikey
        self.location = location
        self.deeplink = deeplink
        self.id = id
        self.currency = currency
        self.thumb = thumb
        self.userRating = userRating
        self.r = r
        self.menuUrl = menuUrl
        self.url = url
        self.eventsUrl = eventsUrl
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.priceRange = aDecoder.decodeObject(forKey: SerializationKeys.priceRange) as? Int
        self.featuredImage = aDecoder.decodeObject(forKey: SerializationKeys.featuredImage) as? String
        self.photosUrl = aDecoder.decodeObject(forKey: SerializationKeys.photosUrl) as? String
        self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.cuisines = aDecoder.decodeObject(forKey: SerializationKeys.cuisines) as? String
        self.zomatoEvents = aDecoder.decodeObject(forKey: SerializationKeys.zomatoEvents) as? [ZomatoEvents]
        self.switchToOrderMenu = aDecoder.decodeObject(forKey: SerializationKeys.switchToOrderMenu) as? Int
        self.hasOnlineDelivery = aDecoder.decodeObject(forKey: SerializationKeys.hasOnlineDelivery) as? Int
        self.averageCostForTwo = aDecoder.decodeObject(forKey: SerializationKeys.averageCostForTwo) as? Int
        self.hasTableBooking = aDecoder.decodeObject(forKey: SerializationKeys.hasTableBooking) as? Int
        self.isDeliveringNow = aDecoder.decodeObject(forKey: SerializationKeys.isDeliveringNow) as? Int
        self.apikey = aDecoder.decodeObject(forKey: SerializationKeys.apikey) as? String
        self.location = aDecoder.decodeObject(forKey: SerializationKeys.location) as? Location
        self.deeplink = aDecoder.decodeObject(forKey: SerializationKeys.deeplink) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
        self.currency = aDecoder.decodeObject(forKey: SerializationKeys.currency) as? String
        self.thumb = aDecoder.decodeObject(forKey: SerializationKeys.thumb) as? String
        self.userRating = aDecoder.decodeObject(forKey: SerializationKeys.userRating) as? UserRating
        self.r = aDecoder.decodeObject(forKey: SerializationKeys.r) as? R
        self.menuUrl = aDecoder.decodeObject(forKey: SerializationKeys.menuUrl) as? String
        self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
        self.eventsUrl = aDecoder.decodeObject(forKey: SerializationKeys.eventsUrl) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(priceRange, forKey: SerializationKeys.priceRange)
        aCoder.encode(featuredImage, forKey: SerializationKeys.featuredImage)
        aCoder.encode(photosUrl, forKey: SerializationKeys.photosUrl)
        aCoder.encode(name, forKey: SerializationKeys.name)
        aCoder.encode(cuisines, forKey: SerializationKeys.cuisines)
        aCoder.encode(zomatoEvents, forKey: SerializationKeys.zomatoEvents)
        aCoder.encode(switchToOrderMenu, forKey: SerializationKeys.switchToOrderMenu)
        aCoder.encode(hasOnlineDelivery, forKey: SerializationKeys.hasOnlineDelivery)
        aCoder.encode(averageCostForTwo, forKey: SerializationKeys.averageCostForTwo)
        aCoder.encode(hasTableBooking, forKey: SerializationKeys.hasTableBooking)
        aCoder.encode(isDeliveringNow, forKey: SerializationKeys.isDeliveringNow)
        aCoder.encode(apikey, forKey: SerializationKeys.apikey)
        aCoder.encode(location, forKey: SerializationKeys.location)
        aCoder.encode(deeplink, forKey: SerializationKeys.deeplink)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(currency, forKey: SerializationKeys.currency)
        aCoder.encode(thumb, forKey: SerializationKeys.thumb)
        aCoder.encode(userRating, forKey: SerializationKeys.userRating)
        aCoder.encode(r, forKey: SerializationKeys.r)
        aCoder.encode(menuUrl, forKey: SerializationKeys.menuUrl)
        aCoder.encode(url, forKey: SerializationKeys.url)
        aCoder.encode(eventsUrl, forKey: SerializationKeys.eventsUrl)
    }
}

extension Restaurant : Decodable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    enum RestaurantSerializationKeys : String,CodingKey {
        case priceRange = "price_range"
        case featuredImage = "featured_image"
        case photosUrl = "photos_url"
        case name = "name"
        case cuisines = "cuisines"
        case zomatoEvents = "zomato_events"
        case switchToOrderMenu = "switch_to_order_menu"
        case hasOnlineDelivery = "has_online_delivery"
        case averageCostForTwo = "average_cost_for_two"
        case hasTableBooking = "has_table_booking"
        case isDeliveringNow = "is_delivering_now"
        case apikey = "apikey"
        case location = "location"
        case deeplink = "deeplink"
        case id = "id"
        case currency = "currency"
        case thumb = "thumb"
        case userRating = "user_rating"
        case r = "R"
        case menuUrl = "menu_url"
        case url = "url"
        case eventsUrl = "events_url"
    }
    
    /*
     init(priceRange: Int?, featuredImage: String?, photosUrl: String?, name: String?, cuisines: String?, zomatoEvents: [ZomatoEvents]?, switchToOrderMenu: Int?, hasOnlineDelivery: Int?, averageCostForTwo: Int?, hasTableBooking: Int?, isDeliveringNow: Int?, apikey: String?, location: Location?, deeplink: String?, id: String?, currency: String?, thumb: String?, userRating: UserRating?, r: R?, menuUrl: String?, offers: [Any]?, url: String?, eventsUrl: String?){
     */
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RestaurantSerializationKeys.self)
        
        let priceRange = try container.decodeIfPresent(Int.self, forKey: .priceRange)
        let featuredImage = try container.decodeIfPresent(String.self, forKey: .featuredImage)
        let photosUrl = try container.decodeIfPresent(String.self, forKey: .photosUrl)
        let name = try container.decodeIfPresent(String.self, forKey: .name)
        let cuisines = try container.decodeIfPresent(String.self, forKey: .cuisines)
        let zomatoEvents = try container.decodeIfPresent([ZomatoEvents].self, forKey: .zomatoEvents)
        let switchToOrderMenu = try container.decodeIfPresent(Int.self, forKey: .switchToOrderMenu)
        let hasOnlineDelivery = try container.decodeIfPresent(Int.self, forKey: .hasOnlineDelivery)
        let averageCostForTwo = try container.decodeIfPresent(Int.self, forKey: .averageCostForTwo)
        let hasTableBooking = try container.decodeIfPresent(Int.self, forKey: .hasTableBooking)
        let isDeliveringNow = try container.decodeIfPresent(Int.self, forKey: .isDeliveringNow)
        let apikey = try container.decodeIfPresent(String.self, forKey: .apikey)
        let location = try container.decodeIfPresent(Location.self, forKey: .location)
        let deeplink = try container.decodeIfPresent(String.self, forKey: .deeplink)
        let id = try container.decodeIfPresent(String.self, forKey: .id)
        let currency = try container.decodeIfPresent(String.self, forKey: .currency)
        let thumb = try container.decodeIfPresent(String.self, forKey: .thumb)
        let userRating =  try container.decodeIfPresent(UserRating.self, forKey: .userRating)
        let r = try container.decodeIfPresent(R.self, forKey: .r)
        let menuUrl = try container.decodeIfPresent(String.self, forKey: .menuUrl)
        let url = try container.decodeIfPresent(String.self, forKey: .url)
        let eventsUrl = try container.decodeIfPresent(String.self, forKey: .eventsUrl)
        
        self.init(priceRange: priceRange, featuredImage: featuredImage, photosUrl: photosUrl, name: name, cuisines: cuisines, zomatoEvents: zomatoEvents, switchToOrderMenu: switchToOrderMenu, hasOnlineDelivery: hasOnlineDelivery, averageCostForTwo: averageCostForTwo, hasTableBooking: hasTableBooking, isDeliveringNow: isDeliveringNow, apikey: apikey, location: location, deeplink: deeplink, id: id, currency: currency, thumb: thumb, userRating: userRating, r: r, menuUrl: menuUrl, url: url, eventsUrl: eventsUrl)
    }

}
