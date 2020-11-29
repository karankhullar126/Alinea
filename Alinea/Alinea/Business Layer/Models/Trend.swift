//
//  Trend.swift
//  Alinea
//
//  Created by Karan Khullar on 28/11/20.
//

import Foundation
import UIKit

struct Trend {
    var id:Int
    var title: String
    var subTitle:String
    var change: Double
    var icon: UIImage
    var changeType:TrendChangeType
    
    
    static func getDummyTrends() -> [TrendType: [Trend]] {
        let trend1 = Trend(id: 1, title: "Mediafast", subTitle: "MEDI", change: 50.78, icon: #imageLiteral(resourceName: "Medifast"), changeType: .increase)
        
        
        let trend2 = Trend(id: 1, title: "Slack Technologies", subTitle: "WORK", change: 5.99, icon: #imageLiteral(resourceName: "Slack"), changeType: .decrease)
        
        return [.gainer: [trend1], .seller: [trend2]]
    }
}

