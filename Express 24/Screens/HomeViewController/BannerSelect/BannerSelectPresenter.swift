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
    var viewController: BannerSelectViewController?

    
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
    func numberOfItemsInSection(for section: Int) -> Int { return model.bannerSelect.count }
    
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
        // Print indexPath to verify it
        print("Did select item at indexPath: \(indexPath)")
        
        // Check if navigation controller is available
        guard let navigationController = viewController?.navigationController else {
            print("Navigation controller is nil")
            return
        }
        
        // Ensure the selected index path is within the collection view's bounds
        guard indexPath.row < model.bannerSelect.count else {
            print("Invalid index path")
            return
        }
        
        // Instantiate the SelectViewController properly
        let marketDetailVC = SelectViewController() // Instantiate properly according to your app logic
        
        // Push the view controller to the navigation stack
        navigationController.pushViewController(marketDetailVC, animated: true)
        
        // Ensure collectionView.cellForItem(at:) returns a cell before performing operations on it
        guard let selectedCell = collectionView.cellForItem(at: indexPath) else {
            print("Selected cell is nil")
            return
        }
        
        // Animate the selected cell
        UIView.animate(withDuration: 0.2, animations: {
            selectedCell.alpha = 0.8
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                selectedCell.transform = .identity
                selectedCell.alpha = 1.0
            }
        }
        
        print("CollectionView element \(indexPath.row) was selected.")
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
