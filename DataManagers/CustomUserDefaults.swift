//
//  CustomUserDefaults.swift
//  MyCliniQ
//
//  Created by GuruApzzo on 06/09/23.
//

import Foundation
import UIKit

let ACCESS_TOKEN = "Access_Token"
let REFRESH_ACCESS_TOKEN = "REFRESH_ACCESS_TOKEN"
let USER_ID = "USER_ID"
let PHONE = "PHONENUMBER"
let PHONEWITHCC = "PHONEWITHCC"
let CODE = "COUNTRYCODE"
let CUSTOMER_ID = "CUSTOMER_ID"
let NAME = "NAME"
let EMAIL_ID = "EMAIL_ID"

class CustomUserDefaults: NSObject {
    // MARK:- Set & Get Access Token
    static var accessToken: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: ACCESS_TOKEN)
        }
        get {
            UserDefaults.standard.value(forKey: ACCESS_TOKEN) as? String
        }
    }
    
    static var refreshAccessToken: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: REFRESH_ACCESS_TOKEN)
        }
        get {
            UserDefaults.standard.value(forKey: REFRESH_ACCESS_TOKEN) as? String
        }
    }
    
    static var userId: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: USER_ID)
        }
        get {
            UserDefaults.standard.value(forKey: USER_ID) as? String
        }
    }
    
    static var phoneNumber: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: PHONE)
        }
        get {
            UserDefaults.standard.value(forKey: PHONE) as? String
        }
    }
    
    static var phoneNumberWithCC: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: PHONEWITHCC)
        }
        get {
            UserDefaults.standard.value(forKey: PHONEWITHCC) as? String
        }
    }
    
    static var countryCode: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: CODE)
        }
        get {
            UserDefaults.standard.value(forKey: CODE) as? String
        }
    }
    
    static var CustomerId: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: CUSTOMER_ID)
        }
        get {
            UserDefaults.standard.value(forKey: CUSTOMER_ID) as? String
        }
    }
    
    static var name: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: NAME)
        }
        get {
            UserDefaults.standard.value(forKey: NAME) as? String
        }
    }
    
    static var emailID: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: EMAIL_ID)
        }
        get {
            UserDefaults.standard.value(forKey: EMAIL_ID) as? String
        }
    }
    
   
}
