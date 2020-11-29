//
//  Theme.swift
//  Alinea
//
//  Created by Karan Khullar on 28/11/20.
//

import Foundation
import UIKit

struct Theme {
    var id:Int
    var title: String
    var icon: UIImage
    
    static func getDummyThemes() -> [Theme] {
        let theme1 = Theme(id: 1, title: "Diversity &\nIncludsion", icon: #imageLiteral(resourceName: "Diversity"))
        
        let theme2 = Theme(id: 2, title: "Bold", icon: #imageLiteral(resourceName: "Bold"))
        
        let theme3 = Theme(id: 3, title: "Crypto Control", icon: #imageLiteral(resourceName: "Crypto"))
        
        let theme4 = Theme(id: 4, title: "She runs It", icon: #imageLiteral(resourceName: "SheRunsIt"))
        
        return [theme1, theme2, theme3, theme4]
    }
}
