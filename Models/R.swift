//
//  R.swift
//
//  Created by Abhinav Roy on 18/01/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class R: NSObject,NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let resId = "res_id"
    }
    
    // MARK: Properties
    public var resId: Int?
    
    init(resId: Int?){
        self.resId = resId
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.resId = aDecoder.decodeObject(forKey: SerializationKeys.resId) as? Int
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(resId, forKey: SerializationKeys.resId)
    }
}

extension R : Decodable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    enum RSerializationKeys : String,CodingKey {
        case resId = "res_id"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RSerializationKeys.self)
        let resId = try container.decodeIfPresent(Int.self, forKey: .resId)
        self.init(resId: resId)
    }

}
