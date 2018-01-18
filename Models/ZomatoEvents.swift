//
//  ZomatoEvents.swift
//
//  Created by Abhinav Roy on 18/01/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class ZomatoEvents: NSObject,NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let event = "event"
    }
    
    // MARK: Properties
    public var event: Event?
    
    init(event: Event?){
        self.event = event
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.event = aDecoder.decodeObject(forKey: SerializationKeys.event) as? Event
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(event, forKey: SerializationKeys.event)
    }
}

extension ZomatoEvents  : Decodable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    enum ZomatoEventsSerializationKeys : String,CodingKey {
        case event = "event"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ZomatoEventsSerializationKeys.self)
        let event = try container.decodeIfPresent(Event.self, forKey: .event)
        self.init(event: event)
    }
}
