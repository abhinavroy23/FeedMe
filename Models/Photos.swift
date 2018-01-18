//
//  Photos.swift
//
//  Created by Abhinav Roy on 18/01/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Photos : NSObject,NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let photo = "photo"
    }
    
    // MARK: Properties
    public var photo: Photo?
    
    init(photo: Photo?){
        self.photo = photo
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.photo = aDecoder.decodeObject(forKey: SerializationKeys.photo) as? Photo
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(photo, forKey: SerializationKeys.photo)
    }
}

extension Photos : Decodable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    enum PhotosSerializationKeys : String,CodingKey {
        case photo = "photo"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PhotosSerializationKeys.self)
        let photo = try container.decodeIfPresent(Photo.self, forKey: .photo)
        self.init(photo: photo)
    }
}


