//
//  CategoryCollectionViewCell.swift
//  Alinea
//
//  Created by Karan Khullar on 29/11/20.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CategoryCollectionViewCell"
    
    let categoryView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        return view
    }()
    
    let iconView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .white
        return view
    }()
    
    let titleLabel: UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 17)
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
        addSubview(categoryView)
        categoryView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20)
        
        let stackView = UIStackView(arrangedSubviews: [iconView,titleLabel])
        stackView.spacing = 20
        addSubview(stackView)
        
        iconView.anchor(width: 40, height: 40)
        
        stackView.anchor( left: categoryView.leftAnchor, right: categoryView.rightAnchor, paddingLeft: 20, paddingRight: 20)
        stackView.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor).isActive = true
    }
    
    func configure(category: Category)  {
        iconView.image = category.icon
        titleLabel.text = category.title
        categoryView.backgroundColor = category.color
    }
    
}
