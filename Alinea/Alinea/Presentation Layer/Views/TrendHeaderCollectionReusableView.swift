//
//  TrendHeaderCollectionReusableView.swift
//  Alinea
//
//  Created by Karan Khullar on 29/11/20.
//

import UIKit

class TrendHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "TrendHeaderCollectionReusableView"
    
    var titleLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .black
       lbl.font = .systemFont(ofSize: 17, weight: .bold)
       lbl.textAlignment = .left
       return lbl
    }()
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       
        self.backgroundColor = .white
       addSubview(titleLabel)
       
       titleLabel.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)

   }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}
