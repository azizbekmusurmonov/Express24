//
//  HomeVC.swift
//  Express 24
//
//  Created by MacBook on 15/01/24.
//


//MARK: - In this window, commands are implemented
import UIKit


enum SectionType: Int, CaseIterable {
    case banner
    case story
    case market
    case shop
}

final class HomeVC: UIViewController {
    
    let mainView = HomeView()
    private var presenter: HomeViewPresenterable
    
    init(presenter: HomeViewPresenterable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        presenter.setViewController(view: self)
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.reloadData()
        self.navigationController?.navigationBar.tintColor = UIColor.blue
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { SectionType.allCases.count  }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItemsInSection(for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForRaw(collectionView: collectionView, at: indexPath)
    }
    
    //MARK: header setUp
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
        presenter.viewForSupplementaryElementOfKind(collectionView: collectionView, kind: kind, at: indexPath)
    }
    
    func selectForumItemAt(_ collectionView: UICollectionView, indexPath: IndexPath) {
        presenter.selectForumItem(collectionView, at: indexPath)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectForumItem(collectionView, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return }
        switch sectionType {
        case .banner:
            
            let indexies = collectionView.indexPathsForVisibleItems
            var bannercell: BannerCell? = nil
            
            for cell in collectionView.visibleCells {
                if cell.isKind(of: BannerCell.self) {
                    bannercell = cell as? BannerCell
                    break
                }
            }
            
            
            if !indexies.isEmpty {
                mainView.pageController.currentPage = bannercell?.index ?? .zero
            }
           
        case .story:
            
            break
        case .market:
            break
        case .shop:
            break
        }
        
//        presenter.willDisplay(collectionView: collectionView, at: indexPath)
    }
    
    func scrollToItem(at indexPath: IndexPath) {
        mainView.collectionView.scrollToItem(at: indexPath,  at: .centeredHorizontally, animated: true)
    }
}

