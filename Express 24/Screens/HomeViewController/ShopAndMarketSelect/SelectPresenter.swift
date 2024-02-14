//
//  SelectPresenter.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 09/02/24.
//

import UIKit

protocol SelectViewPresenterable: AnyObject {

    func numberOfItemsInSection(for section: Int) -> Int
    func cellForRaw(
        collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionViewCell
    
    func viewForSupplementaryElementOfKind(
        collectionView: UICollectionView,
        kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView
}

final class SelectPresenter: SelectViewPresenterable {
    
    func numberOfItemsInSection(for section: Int) -> Int {
        guard let sectionType = SelectShopSectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
            
        case .banner:
            return 1
        case .order:
            return 1
        case .raiting:
            return 2
        case .categories:
            return 10
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
            cell.imageName.text = "Oshxona"
            cell.imageView.image = UIImage(named: "bannerSelect")
            cell.minPrice.text = "Minimal buyurtma narxi 20000 so'm"
            return cell
        case .order:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "orderSelectCell",
                for: indexPath
            ) as? OrderSelectCell else {
                return UICollectionViewCell()
                
            }
            cell.backgroundColor = .white
            
            return cell
        case .raiting:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "raitingCell",
                for: indexPath
            ) as? RaitingCell else {
                return UICollectionViewCell()
                
            }
            
            cell.backgroundColor = .systemGray6
            
            if indexPath.row == 0 {
                cell.raightingTitle.text = "35 - 45 мин"
                cell.labelCell.text = "Yetkazib berish vaq"
                cell.labelCell.textColor = .rgb(132, 132, 132)
            } else {
                cell.raightingTitle.text = "4.6 (500+)"
                cell.labelCell.text = "Reyting"
            }
            
            return cell
        case .categories:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "categoriesSelectCell",
                for: indexPath
            ) as? CategoriesSelectCell else {
                return UICollectionViewCell()
                
            }
            cell.backgroundColor = .white
            return cell
        }
    }
    
    func viewForSupplementaryElementOfKind(
        collectionView: UICollectionView,
        kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "selectHeaderView",
                for: indexPath) as? SelectHeaderView else { return UICollectionReusableView() }
            
            headerView.header.text = "Turkumlar"
            
            return headerView
        }
        return UICollectionReusableView()
    }
}
