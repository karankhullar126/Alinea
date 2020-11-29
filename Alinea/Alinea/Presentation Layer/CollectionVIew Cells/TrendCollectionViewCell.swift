//
//  TrendCollectionViewCell.swift
//  Alinea
//
//  Created by Karan Khullar on 29/11/20.
//

import UIKit

class TrendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TrendCollectionViewCell"
    
    let iconImageView: UIImageView = {
       let view = UIImageView()
        view.layer.cornerRadius = 25
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let titleLAbel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let subTitle: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let changeLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let changeBackgroundVIew: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI()  {
        addSubview(iconImageView)
        iconImageView.anchor(left: leftAnchor, paddingLeft: 20, width: 50, height: 50)
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [titleLAbel, subTitle])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.anchor(left: iconImageView.rightAnchor, paddingLeft: 16)
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(changeBackgroundVIew)
        changeBackgroundVIew.anchor(left: stackView.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 20, width: 70, height: 20)
        changeBackgroundVIew.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(changeLabel)
        changeLabel.anchor(top: changeBackgroundVIew.topAnchor, left: changeBackgroundVIew.leftAnchor, bottom: changeBackgroundVIew.bottomAnchor, right: changeBackgroundVIew.rightAnchor)
        
    }
    
    func configure(trend: Trend)  {
        iconImageView.image = trend.icon
        titleLAbel.text = trend.title
        subTitle.text = trend.subTitle
        switch trend.changeType {
        case .increase:
            changeBackgroundVIew.backgroundColor = .systemGreen
            changeLabel.text = "+\(trend.change)%"
        case.decrease:
            changeBackgroundVIew.backgroundColor = .systemRed
            changeLabel.text = "-\(trend.change)%"
        }
    }
}
