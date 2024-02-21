//
//  HomeView.swift
//  Express 24
//
//  Created by MacBook on 24/01/24.
//

import UIKit

final class HomeView: UIView {
        
    //MARK: - HomeCollectionView
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: "bannerCell")
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: "storyCell")
        collectionView.register(MarketCell.self, forCellWithReuseIdentifier: "marketCell")
        collectionView.register(ShopCell.self, forCellWithReuseIdentifier: "shopCell")
        collectionView.register(
            HomeSectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "HomeBalanceReusableView")
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: "footerView"
        )

        return collectionView
    }()
    
    private let navigationBar: UINavigationBar = {
        let bar = UINavigationBar()
        let navigationItem = UINavigationItem(title: "")

        let buttonLocation = UIButton(type: .system)
        buttonLocation.setTitle("", for: .normal)
        buttonLocation.addTarget(HomeView.self, action: #selector(locationButtonTapped), for: .touchUpInside)

        let locationBarButton = UIBarButtonItem(customView: buttonLocation)
        navigationItem.rightBarButtonItem = locationBarButton

        bar.items = [navigationItem]
        return bar
    }()
    
    //MARK: - BannerTo pageControl
    private lazy var bannerPageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        return pageControl
    }()
    //MARK: - RefreshControl
    private lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        return control
    }()
    
    let pageController: UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.currentPage = 0
        pageControll.currentPageIndicatorTintColor = .black
        pageControll.backgroundStyle = .prominent
        
        return pageControll
    }()
    

    init() {
        super.init(frame: .zero)
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  0).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        addSubview(bannerPageControl)
        bannerPageControl.translatesAutoresizingMaskIntoConstraints = false
        bannerPageControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bannerPageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, 
                                                  constant: -10).isActive = true
        
        collectionView.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.setConstraint(from: .left, from: self, 0)
        navigationBar.setConstraint(from: .right, from: self, 0)
        navigationBar.setConstraint(from: .top, from: self, 0)
        navigationBar.setConstraint(from: .height, from: self, 100)
        navigationBar.backgroundColor = .white
        
        addSubview(collectionView)
        collectionView.refreshControl = refreshControl
    }
    //MARK: - @objc func Refresh
    @objc private func handleRefresh(_ sender: UIRefreshControl) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            sender.endRefreshing()
        }
    }
    
    @objc private func locationButtonTapped() {
        // Tugma bosilganda amalni bajarish uchun funksiya
        print("Location button tapped!")
    }
    
    //MARK: - SetUp CollectionView
    private func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            guard let sectionType = SectionType(rawValue: sectionIndex) else { return nil }
            
            switch sectionType {
                
                //MARK: -  Banner constrint
            case .banner:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                       heightDimension: .absolute(120))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
               //MARK: - pageControl
                let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
                let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: supplementarySize,
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
                supplementaryItem.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
                section.boundarySupplementaryItems = [supplementaryItem]
                
                return section
                //MARK: - Story constrint
            case .story:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100),
                                                       heightDimension: .absolute(120))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 25, leading: 10, bottom: 10, trailing: 10)
                
                return section
                //MARK: - Market constriant
            case .market:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140),
                                                       heightDimension: .absolute(80))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 10, leading: 10, bottom: 40, trailing: 10)
                
                let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                               heightDimension: .absolute(40))
                let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: supplementarySize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [supplementaryItem]
                
                return section
                //MARK: -  Shop Constriant
            case .shop:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(300))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                               heightDimension: .absolute(100))
                let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: supplementarySize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [supplementaryItem]
                section.contentInsets = .init(top: 0, leading: 10, bottom: 40, trailing: 10)
                
                return section
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
