//
//  SelectViewController.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 09/02/24.
//

import UIKit

enum SelectShopSectionType: Int, CaseIterable {
    case banner
    case order
    case raiting
    case categories
}

final class SelectViewController: UIViewController {

    var marketData: MarketModel?
    var shopData: ShopModel?
    private let selectView = SelectView()
    private let presenter: SelectViewPresenterable
    
    init() {
        self.presenter = SelectPresenter()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        selectView.collectionView.delegate = self
        selectView.collectionView.dataSource = self
        
        view.addSubview(selectView)
        
        selectView.translatesAutoresizingMaskIntoConstraints = false
        selectView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        selectView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor).isActive = true
        selectView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor).isActive = true
        selectView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        tabBarController?.tabBar.isHidden = false
    }
}

extension SelectViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        presenter.numberOfItemsInSection(for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForRaw(collectionView: collectionView, at: indexPath)
    }
    
//    func collectionView(
//        _ collectionView: UICollectionView,
//        viewForSupplementaryElementOfKind kind: String,
//        at indexPath: IndexPath) -> UICollectionReusableView {
//            presenter.viewForSupplementaryElementOfKind(collectionView: collectionView,
//                                                        kind: kind, at: indexPath)
//        }
    
}
