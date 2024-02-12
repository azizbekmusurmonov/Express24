//
//  BannerSelecyViewController.swift
//  Express 24
//
//  Created by MacBook on 02/02/24.
//

import UIKit

final class BannerSelectViewController: UIViewController {
    
    var bannerData: BannerModel?
    private let bannerSelectView = BannerSelectView()
    private let presenter: BannerSelectPresenter
    
    init() {
        self.presenter = BannerSelectPresenter()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        bannerSelectView.collectionView.dataSource = self
        bannerSelectView.collectionView.delegate = self
                
        setupBannerView()
        
        if let bannerData = bannerData {
            print("BannerDetailViewController - ID: \(bannerData.id), Image URL: \(bannerData.imageUrl)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupBannerView() {
        
        view.addSubview(bannerSelectView)
        
        bannerSelectView.translatesAutoresizingMaskIntoConstraints = false
        bannerSelectView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        bannerSelectView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor).isActive = true
        bannerSelectView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor).isActive = true
        bannerSelectView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension BannerSelectViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
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
            presenter.viewForSupplementaryElementOfKind(collectionView: collectionView,
                                                        kind: kind, at: indexPath)
        }
    
    func collectionView(_ collectionView: UICollectionView, 
                        didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(collectionView, at: indexPath)
    }
}

