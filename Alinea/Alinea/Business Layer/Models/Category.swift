//
//  Category.swift
//  Alinea
//
//  Created by Karan Khullar on 28/11/20.
//

import Foundation
import UIKit

struct Category {
    var id:Int
    var title: String
    var icon: UIImage
    var color: UIColor
    
    static func getDummyCategory() -> [Category] {
        let categoyr1 = Category(id: 0, title: "Stocks", icon: UIImage(systemName: "globe")!, color: .systemPurple)
        
        let category2 = Category(id: 1, title: "ETFs", icon: UIImage(systemName: "smiley")!, color: .systemBlue)
        
        let category3 = Category(id: 2, title: "Crypto", icon: UIImage(systemName: "coloncurrencysign.circle")!, color: .systemYellow)
        
        return [categoyr1, category2, category3]
    }
}
