//
//  ExploreViewController.swift
//  Alinea
//
//  Created by Karan Khullar on 28/11/20.
//

import UIKit

class ExploreViewController: UIViewController {

    // MARK: - Views
    var categoryButton: UIButton = {
       let button = UIButton()
        let title = "Category"
        button.setAttributedTitle(NSMutableAttributedString(string: title), for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        let titleString = NSMutableAttributedString(string: title)
        titleString.addAttribute(.underlineStyle,
                                 value: NSUnderlineStyle.single.rawValue,
                                 range: NSRange(location: 0, length: title.count))
        
        titleString.addAttribute(.foregroundColor, value: UIColor.systemPurple, range: NSRange(location: 0, length: title.count))
        button.setAttributedTitle(titleString, for: .selected)
        button.addTarget(self, action: #selector(exploreOptionAction(_:)), for: .touchUpInside)
        button.tag = ExploreType.category.rawValue
        button.isSelected = true
        return button
    }()
    
    var themesButton: UIButton = {
       let button = UIButton()
        let title = "Themes"
        button.setAttributedTitle(NSMutableAttributedString(string: title), for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        let titleString = NSMutableAttributedString(string: title)
        titleString.addAttribute(.underlineStyle,
                                 value: NSUnderlineStyle.single.rawValue,
                                 range: NSRange(location: 0, length: title.count))
        titleString.addAttribute(.foregroundColor, value: UIColor.systemPurple, range: NSRange(location: 0, length: title.count))
        button.setAttributedTitle(titleString, for: .selected)
        button.addTarget(self, action: #selector(exploreOptionAction(_:)), for: .touchUpInside)
        button.tag = ExploreType.theme.rawValue
        return button
    }()
    
    
    var trendingButton: UIButton = {
       let button = UIButton()
        let title = "Trending"
        button.setAttributedTitle(NSMutableAttributedString(string: title), for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        let titleString = NSMutableAttributedString(string: title)
        titleString.addAttribute(.underlineStyle,
                                 value: NSUnderlineStyle.single.rawValue,
                                 range: NSRange(location: 0, length: title.count))
        titleString.addAttribute(.foregroundColor, value: UIColor.systemPurple, range: NSRange(location: 0, length: title.count))
        button.setAttributedTitle(titleString, for: .selected)
        button.addTarget(self, action: #selector(exploreOptionAction(_:)), for: .touchUpInside)
        button.tag = ExploreType.trending.rawValue
        return button
    }()
    
    let exploreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    //MARK: - Prop
    let viewModel = ExploreViewModel()
    
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
    }
    
    // MARK: - Methods
    func setupUI()  {
        self.view.backgroundColor = .white
        // Setup navigcation bar
        self.set(title: "Explore",
                 leftButtonThumb: #imageLiteral(resourceName: "MenuIcon"), leftButtonSelector: #selector(menuAction(_:)),
                 rightButtonThumb: UIImage(systemName: "bell"), rightButtonSelector: #selector(notificationAction(_:)),
                 target: self)
        // Top explore options
        let exploreOptionsStack = UIStackView(arrangedSubviews: [categoryButton, themesButton, trendingButton])
        exploreOptionsStack.distribution = .fillEqually
        view.addSubview(exploreOptionsStack)
        exploreOptionsStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 50)
        // Separators
        let separatorView1 = UIView()
        separatorView1.backgroundColor = .lightGray
        view.addSubview(separatorView1)
        separatorView1.anchor( left: categoryButton.rightAnchor, width: 2, height: 8)
        separatorView1.centerYAnchor.constraint(equalTo: categoryButton.centerYAnchor).isActive = true
        
        let separatorView2 = UIView()
        separatorView2.backgroundColor = .lightGray
        view.addSubview(separatorView2)
        separatorView2.anchor( left: themesButton.rightAnchor, width: 2, height: 8)
        separatorView2.centerYAnchor.constraint(equalTo: themesButton.centerYAnchor).isActive = true
        // CollectionVIew
        
        view.addSubview(exploreCollectionView)
        exploreCollectionView.anchor(top: exploreOptionsStack.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func setupCollectionView()  {
        exploreCollectionView.delegate = self
        exploreCollectionView.dataSource = self
        
        exploreCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        exploreCollectionView.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: ThemeCollectionViewCell.identifier)
        exploreCollectionView.register(TrendCollectionViewCell.self, forCellWithReuseIdentifier: TrendCollectionViewCell.identifier)
        exploreCollectionView.register(TrendHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TrendHeaderCollectionReusableView.identifier)
    }
    
    func unselectAllOptions()  {
        categoryButton.isSelected = false
        themesButton.isSelected = false
        trendingButton.isSelected = false
    }
    
    func reloadCollection()  {
        self.exploreCollectionView.reloadData()
        // Reload sections with animations.
        let range = Range(uncheckedBounds: (0, self.viewModel.numberOfSections()))
        let indexSet = IndexSet(integersIn: range)
        self.exploreCollectionView.reloadSections(indexSet)
    }
    
    // MARK: - Actions
    @objc
    func menuAction(_ sender: Any)  {
        
    }
    
    @objc
    func notificationAction(_ sender: Any)  {
        
    }
    
    @objc
    func exploreOptionAction(_ sender: UIButton)  {
        unselectAllOptions()
        sender.isSelected = true
        if let type = ExploreType(rawValue: sender.tag) {
            let isReloadRequired = type != viewModel.selectedExploreType
            viewModel.selectedExploreType = type
            if isReloadRequired {reloadCollection()}
            
        }
    }

}
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewModel.cell(indexPath: indexPath, collectionView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.cellSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TrendHeaderCollectionReusableView.identifier, for: indexPath) as! TrendHeaderCollectionReusableView
        header.titleLabel.text = TrendType(rawValue: indexPath.section)?.title()
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return viewModel.headerSize()
    }
    
}
