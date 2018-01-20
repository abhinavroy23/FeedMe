//
//  Utility.swift
//  FeedMe
//
//  Created by Abhinav Roy on 17/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    static func showError(withMessage message:String, onViewController vc:UIViewController){
        let alertController = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func showMessage(withTitle title: String, andMessage message:String, onViewController vc:UIViewController, okTappedCallback : @escaping ()-> ()){
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: .default) { (alertAction) in
            okTappedCallback()
        }
        alertController.addAction(alertAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    
    static func getStringFromKeychain(forKey key:String) -> String?{
        var data : String? = nil
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: key, accessGroup: KeychainConfiguration.accessGroup)
            data = try passwordItem.readPassword()
        }
        catch {
            print("Error reading key from keychain - \(error)")
        }
        return data
    }
    
    static func setStringInKeychain(forKey key:String, andData data:String) -> Bool{
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: key, accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.savePassword(data)
            return true
        }
        catch {
            print("Error updating keychain - \(error)")
            return false
        }
    }
    
    static func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        let scanner: Scanner = Scanner(string: hexStr)
        scanner.charactersToBeSkipped = CharacterSet.init(charactersIn: "#")
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }

}
