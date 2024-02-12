//
//  SelectView.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 09/02/24.
//

import UIKit

final class SelectView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createLayout()
        )
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(BannerImageCell.self,
                                 forCellWithReuseIdentifier: "bannerImageCell")
        collectionView.register(OrderSelectCell.self,
                                 forCellWithReuseIdentifier: "orderSelectCell")
        collectionView.register(RaitingCell.self,
                                 forCellWithReuseIdentifier: "raitingCell")
        collectionView.register(CategoriesSelectCell.self,
                                 forCellWithReuseIdentifier: "categoriesSelectCell")
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // collectionView ni setup qilish
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.setConstraint(from: .top, from: self)
        collectionView.setConstraint(from: .left, from: self)
        collectionView.setConstraint(from: .right, from: self)
        collectionView.setConstraint(from: .bottom, from: self)
    }

    private func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            guard let sectionType = SelectShopSectionType(rawValue: sectionIndex) else {
                return nil
            }
            
            switch sectionType {
            case .banner:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(UIScreen.main.bounds.width ),
                    heightDimension: .estimated(280))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            case .order:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(UIScreen.main.bounds.width ),
                    heightDimension: .estimated(280))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            case .raiting:
                return self.createRaitingSection()
            case .categories:
                return self.createCategoriesSection()
            }
        }
    }
    
//    private func createBannerSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(1))
//        
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .absolute(UIScreen.main.bounds.width ),
//            heightDimension: .estimated(280))
//        
//        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
//            layoutSize: groupSize,
//            subitems: [item])
//        
//        let section = NSCollectionLayoutSection(group: group)
//        
//        return section
//    }
    
//    private func createOrderSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(1))
//        
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .absolute(UIScreen.main.bounds.width ),
//            heightDimension: .estimated(280))
//        
//        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
//            layoutSize: groupSize,
//            subitems: [item])
//        
//        let section = NSCollectionLayoutSection(group: group)
//        
//        return section
//    }
    
    private func createRaitingSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width ),
            heightDimension: .estimated(280))
        
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    private func createCategoriesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width ),
            heightDimension: .estimated(280))
        
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
}
