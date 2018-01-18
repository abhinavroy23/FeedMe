//
//  Photo.swift
//
//  Created by Abhinav Roy on 18/01/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Photo : NSObject,NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let thumbUrl = "thumb_url"
        static let md5sum = "md5sum"
        static let photoId = "photo_id"
        static let uuid = "uuid"
        static let type = "type"
        static let order = "order"
        static let url = "url"
    }
    
    // MARK: Properties
    public var thumbUrl: String?
    public var md5sum: String?
    public var photoId: Int?
    public var uuid: Int?
    public var type: String?
    public var order: Int?
    public var url: String?
    
    init(thumbUrl: String?, md5sum: String?, photoId: Int?, uuid: Int?, type: String?, order: Int?, url: String?) {
        self.thumbUrl = thumbUrl
        self.md5sum = md5sum
        self.photoId = photoId
        self.uuid = uuid
        self.type = type
        self.order = order
        self.url = url
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.thumbUrl = aDecoder.decodeObject(forKey: SerializationKeys.thumbUrl) as? String
        self.md5sum = aDecoder.decodeObject(forKey: SerializationKeys.md5sum) as? String
        self.photoId = aDecoder.decodeObject(forKey: SerializationKeys.photoId) as? Int
        self.uuid = aDecoder.decodeObject(forKey: SerializationKeys.uuid) as? Int
        self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
        self.order = aDecoder.decodeObject(forKey: SerializationKeys.order) as? Int
        self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(thumbUrl, forKey: SerializationKeys.thumbUrl)
        aCoder.encode(md5sum, forKey: SerializationKeys.md5sum)
        aCoder.encode(photoId, forKey: SerializationKeys.photoId)
        aCoder.encode(uuid, forKey: SerializationKeys.uuid)
        aCoder.encode(type, forKey: SerializationKeys.type)
        aCoder.encode(order, forKey: SerializationKeys.order)
        aCoder.encode(url, forKey: SerializationKeys.url)
    }
    
}

extension Photo : Decodable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize
    enum PhotoSerializationKeys : String,CodingKey {
        case thumbUrl = "thumb_url"
        case md5sum = "md5sum"
        case photoId = "photo_id"
        case uuid = "uuid"
        case type = "type"
        case order = "order"
        case url = "url"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PhotoSerializationKeys.self)
        
        let thumbUrl = try container.decodeIfPresent(String.self, forKey: .thumbUrl)
        let md5sum = try container.decodeIfPresent(String.self, forKey: .md5sum)
        let photoId = try container.decodeIfPresent(Int.self, forKey: .photoId)
        let uuid = try container.decodeIfPresent(Int.self, forKey: .uuid)
        let type = try container.decodeIfPresent(String.self, forKey: .type)
        let order = try container.decodeIfPresent(Int.self, forKey: .order)
        let url = try container.decodeIfPresent(String.self, forKey: .url)
        
        self.init(thumbUrl: thumbUrl, md5sum: md5sum, photoId: photoId, uuid: uuid, type: type, order: order, url: url)
    }
}
