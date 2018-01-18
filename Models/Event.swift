//
//  Event.swift
//
//  Created by Abhinav Roy on 18/01/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Event : NSObject,NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let eventCategoryName = "event_category_name"
        static let startTime = "start_time"
        static let bookLink = "book_link"
        static let shareUrl = "share_url"
        static let isActive = "is_active"
        static let displayDate = "display_date"
        static let isValid = "is_valid"
        static let displayTime = "display_time"
        static let friendlyEndDate = "friendly_end_date"
        static let isEndTimeSet = "is_end_time_set"
        static let photos = "photos"
        static let friendlyStartDate = "friendly_start_date"
        static let disclaimer = "disclaimer"
        static let descriptionValue = "description"
        static let dateAdded = "date_added"
        static let restaurants = "restaurants"
        static let endTime = "end_time"
        static let eventCategory = "event_category"
        static let title = "title"
        static let startDate = "start_date"
        static let endDate = "end_date"
        static let eventId = "event_id"
    }
    
    // MARK: Properties
    public var eventCategoryName: String?
    public var startTime: String?
    public var bookLink: String?
    public var shareUrl: String?
    public var isActive: Int?
    public var displayDate: String?
    public var isValid: Int?
    public var displayTime: String?
    public var friendlyEndDate: String?
    public var isEndTimeSet: Int?
    public var photos: [Photos]?
    public var friendlyStartDate: String?
    public var disclaimer: String?
    public var descriptionValue: String?
    public var dateAdded: String?
    public var endTime: String?
    public var eventCategory: Int?
    public var title: String?
    public var startDate: String?
    public var endDate: String?
    public var eventId: Int?
    
    init(eventCategoryName : String?, startTime : String?, bookLink : String?, shareUrl : String?, isActive : Int?, displayDate : String?, isValid : Int?, displayTime : String?, friendlyEndDate : String?, isEndTimeSet : Int?, photos : [Photos]?, friendlyStartDate : String?, disclaimer : String?, descriptionValue : String?, dateAdded : String?, endTime : String?, eventCategory : Int?, title : String?, startDate : String?, endDate : String?, eventId : Int?){
        
        self.eventCategoryName = eventCategoryName
        self.startTime = startTime
        self.bookLink = bookLink
        self.shareUrl = shareUrl
        self.isActive = isActive
        self.displayDate = displayDate
        self.isValid = isValid
        self.displayTime = displayTime
        self.friendlyEndDate = friendlyEndDate
        self.isEndTimeSet = isEndTimeSet
        self.photos = photos
        self.friendlyStartDate = friendlyStartDate
        self.disclaimer = disclaimer
        self.descriptionValue = descriptionValue
        self.dateAdded = dateAdded
        self.endTime = endTime
        self.eventCategory = eventCategory
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.eventId = eventId
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.eventCategoryName = aDecoder.decodeObject(forKey: SerializationKeys.eventCategoryName) as? String
        self.startTime = aDecoder.decodeObject(forKey: SerializationKeys.startTime) as? String
        self.bookLink = aDecoder.decodeObject(forKey: SerializationKeys.bookLink) as? String
        self.shareUrl = aDecoder.decodeObject(forKey: SerializationKeys.shareUrl) as? String
        self.isActive = aDecoder.decodeObject(forKey: SerializationKeys.isActive) as? Int
        self.displayDate = aDecoder.decodeObject(forKey: SerializationKeys.displayDate) as? String
        self.isValid = aDecoder.decodeObject(forKey: SerializationKeys.isValid) as? Int
        self.displayTime = aDecoder.decodeObject(forKey: SerializationKeys.displayTime) as? String
        self.friendlyEndDate = aDecoder.decodeObject(forKey: SerializationKeys.friendlyEndDate) as? String
        self.isEndTimeSet = aDecoder.decodeObject(forKey: SerializationKeys.isEndTimeSet) as? Int
        self.photos = aDecoder.decodeObject(forKey: SerializationKeys.photos) as? [Photos]
        self.friendlyStartDate = aDecoder.decodeObject(forKey: SerializationKeys.friendlyStartDate) as? String
        self.disclaimer = aDecoder.decodeObject(forKey: SerializationKeys.disclaimer) as? String
        self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        self.dateAdded = aDecoder.decodeObject(forKey: SerializationKeys.dateAdded) as? String
        self.endTime = aDecoder.decodeObject(forKey: SerializationKeys.endTime) as? String
        self.eventCategory = aDecoder.decodeObject(forKey: SerializationKeys.eventCategory) as? Int
        self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
        self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
        self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
        self.eventId = aDecoder.decodeObject(forKey: SerializationKeys.eventId) as? Int
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(eventCategoryName, forKey: SerializationKeys.eventCategoryName)
        aCoder.encode(startTime, forKey: SerializationKeys.startTime)
        aCoder.encode(bookLink, forKey: SerializationKeys.bookLink)
        aCoder.encode(shareUrl, forKey: SerializationKeys.shareUrl)
        aCoder.encode(isActive, forKey: SerializationKeys.isActive)
        aCoder.encode(displayDate, forKey: SerializationKeys.displayDate)
        aCoder.encode(isValid, forKey: SerializationKeys.isValid)
        aCoder.encode(displayTime, forKey: SerializationKeys.displayTime)
        aCoder.encode(friendlyEndDate, forKey: SerializationKeys.friendlyEndDate)
        aCoder.encode(isEndTimeSet, forKey: SerializationKeys.isEndTimeSet)
        aCoder.encode(photos, forKey: SerializationKeys.photos)
        aCoder.encode(friendlyStartDate, forKey: SerializationKeys.friendlyStartDate)
        aCoder.encode(disclaimer, forKey: SerializationKeys.disclaimer)
        aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
        aCoder.encode(dateAdded, forKey: SerializationKeys.dateAdded)
        aCoder.encode(endTime, forKey: SerializationKeys.endTime)
        aCoder.encode(eventCategory, forKey: SerializationKeys.eventCategory)
        aCoder.encode(title, forKey: SerializationKeys.title)
        aCoder.encode(startDate, forKey: SerializationKeys.startDate)
        aCoder.encode(endDate, forKey: SerializationKeys.endDate)
        aCoder.encode(eventId, forKey: SerializationKeys.eventId)
    }
    
}

extension Event : Decodable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    enum EventSerializationKeys : String, CodingKey {
        case eventCategoryName = "event_category_name"
        case startTime = "start_time"
        case bookLink = "book_link"
        case shareUrl = "share_url"
        case isActive = "is_active"
        case displayDate = "display_date"
        case isValid = "is_valid"
        case displayTime = "display_time"
        case friendlyEndDate = "friendly_end_date"
        case isEndTimeSet = "is_end_time_set"
        case photos = "photos"
        case friendlyStartDate = "friendly_start_date"
        case disclaimer = "disclaimer"
        case descriptionValue = "description"
        case dateAdded = "date_added"
        case endTime = "end_time"
        case eventCategory = "event_category"
        case title = "title"
        case startDate = "start_date"
        case endDate = "end_date"
        case eventId = "event_id"
    }
    
    
    public convenience init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: EventSerializationKeys.self)
        let eventCategoryName = try container.decodeIfPresent(String.self, forKey: .eventCategoryName)
        let startTime = try container.decodeIfPresent(String.self, forKey: .startTime)
        let bookLink = try container.decodeIfPresent(String.self, forKey: .bookLink)
        let shareUrl = try container.decodeIfPresent(String.self, forKey: .shareUrl)
        let isActive = try container.decodeIfPresent(Int.self, forKey: .isActive)
        let displayDate = try container.decodeIfPresent(String.self, forKey: .displayDate)
        let isValid = try container.decodeIfPresent(Int.self, forKey: .isValid)
        let displayTime = try container.decodeIfPresent(String.self, forKey: .displayTime)
        let friendlyEndDate = try container.decodeIfPresent(String.self, forKey: .friendlyEndDate)
        let isEndTimeSet = try container.decodeIfPresent(Int.self, forKey: .isEndTimeSet)
        let photos = try container.decodeIfPresent([Photos].self, forKey: .photos)
        let friendlyStartDate = try container.decodeIfPresent(String.self, forKey: .friendlyStartDate)
        let disclaimer = try container.decodeIfPresent(String.self, forKey: .disclaimer)
        let descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
        let dateAdded = try container.decodeIfPresent(String.self, forKey: .dateAdded)
        let endTime = try container.decodeIfPresent(String.self, forKey: .endTime)
        let eventCategory = try container.decodeIfPresent(Int.self, forKey: .eventCategory)
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let startDate = try container.decodeIfPresent(String.self, forKey: .startDate)
        let endDate = try container.decodeIfPresent(String.self, forKey: .endDate)
        let eventId = try container.decodeIfPresent(Int.self, forKey: .eventId)
        
        self.init(eventCategoryName : eventCategoryName, startTime : startTime, bookLink : bookLink, shareUrl : shareUrl, isActive : isActive, displayDate : displayDate, isValid : isValid, displayTime : displayTime, friendlyEndDate : friendlyEndDate, isEndTimeSet : isEndTimeSet, photos : photos, friendlyStartDate : friendlyStartDate, disclaimer : disclaimer, descriptionValue : descriptionValue, dateAdded : dateAdded, endTime : endTime, eventCategory : eventCategory, title : title, startDate : startDate, endDate : endDate, eventId : eventId)
    }
}
