//
//  HomePresenter.swift
//  Express 24
//
//  Created by MacBook on 24/01/24.
//
import SwiftUI
import UIKit

protocol HomeViewPresenterable: AnyObject {
    var model: HomeModel { get }
    func numberOfItemsInSection(for section: Int) -> Int
    func cellForRaw(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView,
                                           kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    func selectForumItem(_ collectionView: UICollectionView, at indexPath: IndexPath)
    func setViewController(view: HomeVC)
}

final class HomePresenter: HomeViewPresenterable {
    var viewController: HomeVC?
    
    init() {
        
    }
    
    var model: HomeModel = HomeModel(
    banner: [
        BannerModel(
            id: 0, imageUrl: "banner1"),
        BannerModel(
            id: 1, imageUrl: "banner2"),
        BannerModel(
            id: 2, imageUrl: "banner3")
    ],
    
    story: [
        StoryModel(
            id: 0,
            imageUrl: "story1"),
        StoryModel(
            id: 1,
            imageUrl: "story2"),
        StoryModel(
            id: 2,
            imageUrl: "story3"),
        StoryModel(
            id: 3,
            imageUrl: "story4"),
        StoryModel(
            id: 4,
            imageUrl: "story5")
    ],
    
    market: [
        MarketModel(
            id: 0,
            imageUrl: "market1",
            imageText: "Korzinka Go"),
        MarketModel(
            id: 1,
            imageUrl: "market2",
            imageText: "Full Cart"),
        MarketModel(
            id: 2,
            imageUrl: "market3",
            imageText: "VKUSNO BY SEVA - nimadir")
    ],
    shop: [
        ShopModel(id: 0,
                    imageUrl: "shop1",
                    shopNameLabel: "ДОДО ПИЦЦА",
                    contentLabel: "Пиццерия ¤ Акции"),
        ShopModel(id: 1, imageUrl: "shop2",
                    shopNameLabel: "Ploff&Kebap", contentLabel: "Узбекская ¤ Новинки * Азиатская")
    ]
)
    
    @objc func pageControllChanged(sender: UIPageControl) {
        viewController?.scrollToItem(at: IndexPath(item: sender.currentPage, section: SectionType.banner.rawValue))
    }
    
    func setViewController(view: HomeVC) {
        viewController = view
    }
    
    
    //MARK: - This is Cells Count
    func numberOfItemsInSection(for section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
            
        case .banner:
            return model.banner.count
        case .story:
            return model.story.count
        case .market:
            return model.market.count
        case .shop:
            return model.shop.count
        }
    }
    
    //MARK: - Home Cells setUp
    func cellForRaw(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell()}
        switch sectionType {
            
        case .banner:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "bannerCell",
                for: indexPath
            ) as? BannerCell else {
                return UICollectionViewCell()
                
            }
            
            cell.prepare(data: model.banner[indexPath.row], index: indexPath.item)
            
            return cell
        case .story:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "storyCell",
                for: indexPath
            ) as? StoryCell else {
                return UICollectionViewCell()
            }
            
            cell.prepare(data: model.story[indexPath.row])
            
            return cell
        case .market:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marketCell", for: indexPath) as? MarketCell else {
                return UICollectionViewCell()
            }
            
            cell.prepare(data: model.market[indexPath.row])
            
            return cell
        case .shop:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopCell", for: indexPath) as? ShopCell else {
                return UICollectionViewCell()
            }
            
            cell.prepare(data: model.shop[indexPath.row])
            
            return cell
        }
    }
    
    //MARK: - CollectionView Button
    
    
    func selectForumItem(_ collectionView: UICollectionView, at indexPath: IndexPath) {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return }
        switch sectionType {
        case .banner:
            let selectedBanner = model.banner[indexPath.row]
            // Print selected banner information
            print("Selected Banner ID: \(selectedBanner.id)")
            print("Selected Banner Image URL: \(selectedBanner.imageUrl)")
            
            // Assuming you have a view controller named BannerDetailViewController
            let bannerDetailVC = BannerSelectViewController()
            bannerDetailVC.bannerData = selectedBanner
            //navigationController?.pushViewController(bannerDetailVC, animated: true)
            viewController?.navigationController?.pushViewController(BannerSelectViewController(),
                                                                           animated: true)
            
        case .story:
            let storyView = UIHostingController(rootView: StoriesView())
            storyView.modalPresentationStyle = .fullScreen
            
            viewController?.present(storyView, animated: true)
        case .market:
            let selectedMarket = model.market[indexPath.row]
            
            let marketDetailVC = SelectViewController()
            marketDetailVC.marketData = selectedMarket
            viewController?.navigationController?.pushViewController(
                SelectViewController(), animated: true)
        case .shop:
            let selectedShop = model.shop[indexPath.row]
            
            let shopDetailVC = SelectViewController()
            shopDetailVC.shopData = selectedShop
            viewController?.navigationController?.pushViewController(
                SelectViewController(), animated: true)
        }
        
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
    }
    
    //MARK: - Header SetUp
    func viewForSupplementaryElementOfKind(
        collectionView: UICollectionView,
        kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let sectionType = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
            
            switch sectionType {
                
            case .banner:
                let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: "HomeBalanceReusableView",
                    for: indexPath)
                
                headerView.backgroundColor = .blue
                
                return headerView
                
            case .story:
                let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: "HomeBalanceReusableView",
                    for: indexPath)
                                
                headerView.backgroundColor = .blue
                return headerView
                
            case .market:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: "HomeBalanceReusableView",
                    for: indexPath) as? HomeSectionHeaderView else { return UICollectionReusableView() }
                
                headerView.title.text = "Do‘konlar"
                headerView.title.font = .boldSystemFont(ofSize: 30)
                headerView.button.setTitle("Barchasi>", for: .normal)
                
                return headerView
                
            case .shop:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: "HomeBalanceReusableView",
                    for: indexPath) as? HomeSectionHeaderView else { return UICollectionReusableView() }
                
                headerView.title.text = "Restoranlar"
                headerView.title.font = .boldSystemFont(ofSize: 40)
                
                return headerView
                
            }
        }
        else {
            let footerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: "footerView",
                for: indexPath
            )
           
            viewController?.mainView.pageController.numberOfPages = model.banner.count
            viewController?.mainView.pageController.addTarget(self, action: #selector(pageControllChanged), for: .valueChanged)
            footerView.addSubview(viewController?.mainView.pageController ?? UIView())
            viewController?.mainView.pageController.setConstraint(from: .xCenter, from: footerView)
            viewController?.mainView.pageController.setConstraint(from: .yCenter, from: footerView)
                        
            return footerView
        }
    }
}
