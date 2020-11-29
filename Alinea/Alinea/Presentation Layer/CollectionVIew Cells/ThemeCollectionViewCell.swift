//
//  ThemeCollectionViewCell.swift
//  Alinea
//
//  Created by Karan Khullar on 29/11/20.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ThemeCollectionViewCell"
    
    let themeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(red: 250.0/255.0, green: 251.0/255.0, blue: 252.0/255.0, alpha:  1)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.alpha = 0.5
        return view
    }()
    
    let iconView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let titleLabel: UILabel = {
       let title = UILabel()
        title.textColor = .black
        title.numberOfLines = 2
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textAlignment = .center
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI()  {
        addSubview(themeView)
        themeView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
        
        let stackView = UIStackView(arrangedSubviews: [iconView,titleLabel])
        stackView.spacing = 10
        stackView.axis = .vertical
        addSubview(stackView)
        
        
        stackView.anchor(top: themeView.topAnchor, left: themeView.leftAnchor,bottom: themeView.bottomAnchor, right: themeView.rightAnchor,paddingTop: 20, paddingLeft: 12, paddingBottom: 20, paddingRight: 12)
        stackView.centerYAnchor.constraint(equalTo: themeView.centerYAnchor).isActive = true
    }
    
    func configure(theme: Theme)  {
        iconView.image = theme.icon
        titleLabel.text = theme.title
    }
}
