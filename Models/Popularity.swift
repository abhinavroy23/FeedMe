//
//  Popularity.swift
//
//  Created by Abhinav Roy on 18/01/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Popularity : NSObject,NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let city = "city"
        static let popularity = "popularity"
        static let subzone = "subzone"
        static let subzoneId = "subzone_id"
        static let nightlifeIndex = "nightlife_index"
        static let nightlifeRes = "nightlife_res"
        static let topCuisines = "top_cuisines"
        static let popularityRes = "popularity_res"
        static let nearbyRes = "nearby_res"
    }
    
    // MARK: Properties
    public var city: String?
    public var popularity: String?
    public var subzone: String?
    public var subzoneId: Int?
    public var nightlifeIndex: String?
    public var nightlifeRes: String?
    public var topCuisines: [String]?
    public var popularityRes: String?
    public var nearbyRes: [String]?
    
    //Empty initializer
    init(city: String?, popularity: String?, subzone: String?, subzoneId: Int?, nightlifeIndex: String?, nightlifeRes: String?, topCuisines: [String]?, popularityRes: String?, nearbyRes: [String]?){
        
        self.city = city
        self.popularity = popularity
        self.subzone = subzone
        self.subzoneId = subzoneId
        self.nightlifeIndex = nightlifeIndex
        self.nightlifeRes = nightlifeRes
        self.topCuisines = topCuisines
        self.popularityRes = popularityRes
        self.nearbyRes = nearbyRes
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.city = aDecoder.decodeObject(forKey: SerializationKeys.city) as? String
        self.popularity = aDecoder.decodeObject(forKey: SerializationKeys.popularity) as? String
        self.subzone = aDecoder.decodeObject(forKey: SerializationKeys.subzone) as? String
        self.subzoneId = aDecoder.decodeObject(forKey: SerializationKeys.subzoneId) as? Int
        self.nightlifeIndex = aDecoder.decodeObject(forKey: SerializationKeys.nightlifeIndex) as? String
        self.nightlifeRes = aDecoder.decodeObject(forKey: SerializationKeys.nightlifeRes) as? String
        self.topCuisines = aDecoder.decodeObject(forKey: SerializationKeys.topCuisines) as? [String]
        self.popularityRes = aDecoder.decodeObject(forKey: SerializationKeys.popularityRes) as? String
        self.nearbyRes = aDecoder.decodeObject(forKey: SerializationKeys.nearbyRes) as? [String]
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(city, forKey: SerializationKeys.city)
        aCoder.encode(popularity, forKey: SerializationKeys.popularity)
        aCoder.encode(subzone, forKey: SerializationKeys.subzone)
        aCoder.encode(subzoneId, forKey: SerializationKeys.subzoneId)
        aCoder.encode(nightlifeIndex, forKey: SerializationKeys.nightlifeIndex)
        aCoder.encode(nightlifeRes, forKey: SerializationKeys.nightlifeRes)
        aCoder.encode(topCuisines, forKey: SerializationKeys.topCuisines)
        aCoder.encode(popularityRes, forKey: SerializationKeys.popularityRes)
        aCoder.encode(nearbyRes, forKey: SerializationKeys.nearbyRes)
    }
    
}

extension Popularity : Decodable{
    
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    enum PopularitySerializationKeys: String,CodingKey {
        case city = "city"
        case popularity = "popularity"
        case subzone = "subzone"
        case subzoneId = "subzone_id"
        case nightlifeIndex = "nightlife_index"
        case nightlifeRes = "nightlife_res"
        case topCuisines = "top_cuisines"
        case popularityRes = "popularity_res"
        case nearbyRes = "nearby_res"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PopularitySerializationKeys.self)
        
        let city = try container.decodeIfPresent(String.self, forKey: .city)
        let popularity = try container.decodeIfPresent(String.self, forKey: .popularity)
        let subzone = try container.decodeIfPresent(String.self, forKey: .subzone)
        let subzoneId = try container.decodeIfPresent(Int.self, forKey: .subzoneId)
        let nightlifeIndex = try container.decodeIfPresent(String.self, forKey: .nightlifeIndex)
        let nightlifeRes = try container.decodeIfPresent(String.self, forKey: .nightlifeRes)
        let topCuisines = try container.decodeIfPresent([String].self, forKey: .topCuisines)
        let popularityRes = try container.decodeIfPresent(String.self, forKey: .popularityRes)
        let nearbyRes = try container.decodeIfPresent([String].self, forKey: .nearbyRes)
        
        self.init(city: city, popularity: popularity, subzone: subzone, subzoneId: subzoneId, nightlifeIndex: nightlifeIndex, nightlifeRes: nightlifeRes, topCuisines: topCuisines, popularityRes: popularityRes, nearbyRes: nearbyRes)
    }
}
