//
//  SelectPresenter.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 09/02/24.
//

import UIKit

protocol SelectViewPresenterable: AnyObject {
    //var model: ShopsModel { get }
    func numberOfItemsInSection(for section: Int) -> Int
    func cellForRaw(
        collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionViewCell
//    func viewForSupplementaryElementOfKind(
//        collectionView: UICollectionView,
//        kind: String,
//        at indexPath: IndexPath
//    ) -> UICollectionReusableView
}

final class SelectPresenter: SelectViewPresenterable {
    
    //var model: ShopsModel = ShopsModel(
//        shopSelect:  [
//            ShopSelectModel(
//                id: 0,
//                imageUrl: "bannerSelect",
//                shopNameLabel: "ДОДО ПИЦЦА",
//                contentLabel: "Пиццерия ¤ Акции"
//            ),
//        ]
//    )
    func numberOfItemsInSection(for section: Int) -> Int {
        guard let sectionType = SelectShopSectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
            
        case .banner:
            return 1
        case .order:
            return 1
        case .raiting:
            return 1
        case .categories:
            return 1
        }
    }
    
    func cellForRaw(
        collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let sectionType = SelectShopSectionType(rawValue: indexPath.section
        ) else { return UICollectionViewCell()}
        
        switch sectionType {
            
        case .banner:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "bannerImageCell",
                for: indexPath
            ) as? BannerImageCell else {
                return UICollectionViewCell()
                
            }
            cell.backgroundColor = .systemRed
                        
            return cell
        case .order:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "orderSelectCell",
                for: indexPath
            ) as? OrderSelectCell else {
                return UICollectionViewCell()
                
            }
            cell.backgroundColor = .gray
                        
            return cell
        case .raiting:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "raitingCell",
                for: indexPath
            ) as? RaitingCell else {
                return UICollectionViewCell()
                
            }
               
            cell.backgroundColor = .green
            return cell
        case .categories:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "categoriesSelectCell",
                for: indexPath
            ) as? CategoriesSelectCell else {
                return UICollectionViewCell()
                
            }
            cell.backgroundColor = .blue
            return cell
        }
    }
    
//    func viewForSupplementaryElementOfKind(
//        collectionView: UICollectionView,
//        kind: String,
//        at indexPath: IndexPath
//    ) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            
//            guard let headerView = collectionView.dequeueReusableSupplementaryView(
//                ofKind: UICollectionView.elementKindSectionHeader,
//                withReuseIdentifier: "HomeBalanceReusableView",
//                for: indexPath) as? HomeSectionHeaderView else { return UICollectionReusableView() }
//            
//            headerView.title.text = "Turk taomlar"
//            headerView.title.font = .boldSystemFont(ofSize: 36)
//            headerView.titleContent.text = "Pidedan kabobgacha"
//            headerView.collectionView.isHidden = true
//            
//            return headerView
//        }
//        return UICollectionReusableView()
//    }
}
