//
//  Constant.swift
//  FeedMe
//
//  Created by Abhinav Roy on 17/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

class Constant: NSObject {
    
    //MARK: Screen size constants
    static let SCREEN_WIDTH : CGFloat = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT : CGFloat = UIScreen.main.bounds.size.height
    
    //MARK: ERROR Constants
    static let ERROR_IN_FETCHING_LOCATION = "Unable to fetch user's location!"
    static let ERROR_LOCATION_DISABLED = "Location service is disabled!"
    static let ERROR_FETCHING_DUMMY_DATA = "Fetching restaurants based on dummy location."
    
    //MARK: VC IDENTIFIERS
    static let ID_DETAIL_VC = "DetailViewController"
    static let ID_VC_CELL_TABLE_IDENTIFIER = "ViewControllerTableViewCell"
}
