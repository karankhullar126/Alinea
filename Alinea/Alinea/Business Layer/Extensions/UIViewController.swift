//
//  UIViewController.swift
//  Alinea
//
//  Created by Karan Khullar on 28/11/20.
//

import UIKit

extension UIViewController {
    
    func set(title: String = "",
             leftButtonTitle: String? = nil, leftButtonThumb: UIImage? = nil, leftButtonSelector: Selector? = nil,
             rightButtonTitle: String? = nil, rightButtonThumb: UIImage? = nil, rightButtonSelector: Selector? = nil, target: Any? = nil) {
        
        self.navigationItem.title = title

//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
        
        if let rightSelector = rightButtonSelector {
            let btnRight = UIButton(type: .system)
            btnRight.setTitleColor(.white, for: .normal)
            btnRight.contentMode = .right
            
            btnRight.setTitle(rightButtonTitle, for: .normal)
            if let rightButtonThumb = rightButtonThumb {
                btnRight.leftTitleRightImage(image: rightButtonThumb, renderMode: .alwaysTemplate)
            }
            btnRight.addTarget(target, action: rightSelector, for: .touchUpInside)
            btnRight.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
            
            let backBarButon: UIBarButtonItem = UIBarButtonItem(customView: btnRight)
            btnRight.tintColor = .black
            self.navigationItem.setRightBarButtonItems([backBarButon], animated: false)
            
            btnRight.translatesAutoresizingMaskIntoConstraints = false
            btnRight.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
            btnRight.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        }
        
        if let leftSelector = leftButtonSelector {
            let btnLeft = UIButton(type: .system)
            btnLeft.setTitleColor(.white, for: .normal)
            btnLeft.contentMode = .right

            btnLeft.setTitle(leftButtonTitle, for: .normal)
            if let leftBtnImage = leftButtonThumb {
                btnLeft.leftImageRightTitle(image: leftBtnImage, renderMode: .alwaysOriginal)
            }
            btnLeft.addTarget(target, action: leftSelector, for: .touchUpInside)
            btnLeft.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            
            let backBarButon: UIBarButtonItem = UIBarButtonItem(customView: btnLeft)
            btnLeft.tintColor = .black
            self.navigationItem.setLeftBarButtonItems([backBarButon], animated: false)
            
            btnLeft.translatesAutoresizingMaskIntoConstraints = false
            btnLeft.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
            btnLeft.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        }
        
    }
    
    func showRightIndicator(activityIndicator: UIActivityIndicatorView) {
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        let barButtonItem = UIBarButtonItem(customView: activityIndicator)
        
        self.navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    func stopRightIndicator(activityIndicator: UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
        let barButtonItem = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
}

