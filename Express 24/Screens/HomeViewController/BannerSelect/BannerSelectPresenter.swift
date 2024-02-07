//
//  BannerSelectPresenter.swift
//  Express 24
//
//  Created by MacBook on 02/02/24.
//

import UIKit

protocol BannerSelectViewPresenterable: AnyObject {
    var model: BannersModel { get }
    func numberOfItemsInSection(for section: Int) -> Int
    func cellForRaw(collectionView: UICollectionView,
                    at indexPath: IndexPath) -> UICollectionViewCell
    func viewForSupplementaryElementOfKind(
        collectionView: UICollectionView,
                                           kind: String,
                                           at indexPath: IndexPath
    ) -> UICollectionReusableView
    func didSelectItem(_ collectionView: UICollectionView, at indexPath: IndexPath)
}

final class BannerSelectPresenter: BannerSelectViewPresenterable {
    
    var model: BannersModel = BannersModel(
        bannerSelect:  [
            BannerSelectModel(
                id: 0,
                imageUrl: "bannerSelect",
                shopNameLabel: "ДОДО ПИЦЦА",
                contentLabel: "Пиццерия ¤ Акции"
            ),
            BannerSelectModel(
                id: 0,
                imageUrl: "bannerSelect",
                shopNameLabel: "MUSTAFA",
                contentLabel: "Пиццерия ¤ Акции"
            ),
            BannerSelectModel(
                id: 0,
                imageUrl: "bannerSelect",
                shopNameLabel: "MUSTAFA",
                contentLabel: "Пиццерия ¤ Акции"
            ),
            BannerSelectModel(
                id: 0,
                imageUrl: "bannerSelect",
                shopNameLabel: "MUSTAFA",
                contentLabel: "Пиццерия ¤ Акции"
            ),
        ]
    )
    
    //MARK: - This is Cells Count
    func numberOfItemsInSection(for section: Int) -> Int {
        //guard let sectionType = SectionType(rawValue: section) else { return 0 }
        
        //switch sectionType {
        //case .banner:
            return model.bannerSelect.count
//        //case .story:
//            return 0
//        case .market:
//            return 0
//        case .shop:
//            return 0
        //}
    }
    
    //MARK: - Home Cells setUp
    func cellForRaw(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "bannerSelectCell", for: indexPath) as? BannerSelectCell else {
            return UICollectionViewCell()
        }
        
        cell.prepare(data: model.bannerSelect[indexPath.item])
        
        return cell
    }
    
    //MARK: - CollectionView Button
    
    
    func didSelectItem(_ collectionView: UICollectionView, at indexPath: IndexPath) {
        guard collectionView.cellForItem(at: indexPath) != nil else { return }
        if let selectedCell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2, animations: {
                
                selectedCell.alpha = 0.8
                
            }) { _ in
                UIView.animate(withDuration: 0.2) {
                    selectedCell.transform = .identity
                    selectedCell.alpha = 1.0
                }
            }
        }
        
        print("CollectionView elementi \(indexPath.row) tanlandi.")
    }
    
    //MARK: - Header SetUp
    func viewForSupplementaryElementOfKind(
        collectionView: UICollectionView,
        kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "HomeBalanceReusableView",
                for: indexPath) as? HomeSectionHeaderView else { return UICollectionReusableView() }
            
            headerView.title.text = "Turk taomlar"
            headerView.title.font = .boldSystemFont(ofSize: 36)
            headerView.titleContent.text = "Pidedan kabobgacha"
            headerView.collectionView.isHidden = true
            
            return headerView
        }
        return UICollectionReusableView()
    }
}
