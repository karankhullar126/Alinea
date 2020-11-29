//
//  AppConstants.swift
//  Alinea
//
//  Created by Karan Khullar on 28/11/20.
//

import Foundation


enum ExploreType: Int {
    case category, theme, trending
}

enum TrendChangeType{
    case increase, decrease
}

enum TrendType: Int {
    case gainer, seller
    
    func title() -> String {
        switch self {
        case .gainer:
            return "Top Gainers"
        case .seller:
            return "Top Sellers"
        }
    }
}
