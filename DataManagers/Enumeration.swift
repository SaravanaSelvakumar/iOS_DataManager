//
//  Enumeration.swift
//  MyCliniQ
//
//  Created by GuruApzzo on 06/09/23.
//

import Foundation


enum RootVCType {
    case loginVC
    case tabbarVC
//    case homeVC
//    case splash
}

enum DateFormate: String {
    case normal = "MMMM dd, yyyy"
    case bithDayServerFormat = "yyyy-MM-dd"
    case chatFormat = "dd MMM yyyy"
    case normalWithTime = "MMM dd, yyyy HH:mm:ss"
    case timestampFormat = "yyyy-MM-dd HH:mm:ss"
    case timeFormat = "hh:mm: a"
    case serverTimeFormate = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case secondaryNormalWithTime = "MMM dd, yyyy"
    case messageInfoTime = "dd MMMM, hh:mm a"
}

///   SortType
enum ProductSortType {
    case availability
    case none
    case nearby
    case priceLowToHigh
    case priceHighToLow
    case CustomerTopRatedHighToLow
    case yearsofExperience
    
    var name: String {
        switch self {
        case .availability: return "Availability"
        case .nearby: return "Nearby"
        case .priceLowToHigh: return "Price: Low to High"
        case .priceHighToLow: return "Price High to Low"
        case .CustomerTopRatedHighToLow: return "Customer Top Rated"
        case .yearsofExperience: return "Years of Experience"
        case .none: return ""
            
        }
    }
    
    var sortType: String {
        switch self {
        case .availability: return "desc"
        case .nearby: return "desc"
        case .priceLowToHigh: return "asc"
        case .priceHighToLow: return "desc"
        case .CustomerTopRatedHighToLow: return "desc"
        case .yearsofExperience: return "desc"
        case .none: return ""
        }
    }

    var sortBy: String {
        switch self {
        case .availability: return "createdAt"
        case .nearby: return "createdAt"
        case .priceLowToHigh: return "fee"
        case .priceHighToLow: return "fee"
        case .CustomerTopRatedHighToLow: return "rating"
        case .yearsofExperience: return "experience"
        case .none: return ""
        }
    }

}
// ===================================================================================================== //

enum Language: String {
    case english
    case tamil
    case kannada
    case malayalam
    case telugu
    case hindi
    
    var name: String {
        switch self {
        case .english: return "English"
        case .tamil: return "தமிழ்"
        case .kannada: return "ಕನ್ನಡ"
        case .malayalam: return "മലയാളം"
        case .telugu: return "తెలుగు"
        case .hindi: return "हिंदी"
        }
    }
    
    var selectedlanguage: String {
        switch self {
        case .english: return "English"
        case .tamil: return "Tamil"
        case .kannada: return "Kannada"
        case .malayalam: return "Malayalam"
        case .telugu: return "Telugu"
        case .hindi: return "Hindi"
        }
    }
}
// ===================================================================================================== //
