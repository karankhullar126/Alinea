//
//  ExploreViewModel.swift
//  Alinea
//
//  Created by Karan Khullar on 28/11/20.
//

import Foundation
import UIKit

class ExploreViewModel {
    
    var selectedExploreType:ExploreType = .category
    
    private var categories: [Category] = Category.getDummyCategory()
    private var themes: [Theme] = Theme.getDummyThemes()
    private var trending: [TrendType: [Trend]] = Trend.getDummyTrends()
    
    
    func numberOfSections() -> Int {
        switch selectedExploreType {
        case .trending:
            return trending.count
        default:
            return 1
        }
    }
    
    func numberOfItems(section: Int) -> Int  {
        switch selectedExploreType {
        case .category:
        return categories.count
        case .theme:
            return themes.count
        case .trending:
            if let type = TrendType(rawValue: section) {
                return trending[type]?.count ?? 0
            }
            return 0
        }
    }
    
    func cell(indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        
        switch selectedExploreType {
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.configure(category: categories[indexPath.item])
            return cell
        case .theme:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.identifier, for: indexPath) as! ThemeCollectionViewCell
            cell.configure(theme: themes[indexPath.item])
            return cell
        case .trending:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendCollectionViewCell.identifier, for: indexPath) as! TrendCollectionViewCell
            if let trendType = TrendType(rawValue: indexPath.section), let trends = trending[trendType] {
                cell.configure(trend: trends[indexPath.item])
            }
            return cell
        }
        
    }
    
    func cellSize() -> CGSize  {
        switch selectedExploreType {
        case .category:
            return CGSize(width: UIScreen.main.bounds.width, height: 100)
        case .theme:
            return CGSize(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2)
        case .trending:
            return CGSize(width: UIScreen.main.bounds.width, height: 80)
        }
    }
    
    func headerSize() -> CGSize {
        switch selectedExploreType {
        case .trending:
            return CGSize(width: UIScreen.main.bounds.width, height: 44)
        default:
            return CGSize.zero
        }
    }
    
}
