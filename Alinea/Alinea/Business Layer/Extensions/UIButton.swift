//
//  UIButton.swift
//  Alinea
//
//  Created by Karan Khullar on 28/11/20.
//

import UIKit

extension UIButton {
    func leftImageRightTitle(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -1.4, bottom: 0, right: image.size.width / 2)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .left
    }
    
    func leftTitleRightImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: image.size.width / 3, bottom: 0, right: 1.4)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        self.contentHorizontalAlignment = .right
    }
}

