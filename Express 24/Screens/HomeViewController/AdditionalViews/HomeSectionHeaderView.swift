//
//  HomeSectionHeaderView.swift
//  Express 24
//
//  Created by MacBook on 22/01/24.
//

import UIKit

enum SectionTypeHeader: Int, CaseIterable {
    case category = 0
}

final class HomeSectionHeaderView: UICollectionReusableView {
    
    
    let title = UILabel()
    let titleContent = UILabel()
    let button = UIButton(type: .system)
    lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setUpTitle()
        setUpButton()
        setUpCollectionView()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionType = SectionTypeHeader(rawValue: sectionIndex) else { return nil }
            
            switch sectionType {
                
            case .category:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100),
                                                       heightDimension: .absolute(28))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 8
                section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
                
                return section
            }
        }
        return layout
    }
    
    @objc func categoryButtonTapped() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeSectionHeaderView {
    
    private func setUpTitle() {
        
        addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.setConstraint(from: .left, from: self, 10)
        title.setConstraint(from: .top, from: self, 0)
        title.font = .boldSystemFont(ofSize: 20)
        
        addSubview(titleContent)
        
        titleContent.translatesAutoresizingMaskIntoConstraints = false
        titleContent.setConstraint(from: .left, from: self, 10)
        titleContent.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 0).isActive = true
        titleContent.font = .systemFont(ofSize: 20)
        titleContent.textColor = .rgb(123, 123, 123)
    }
    
    private func setUpButton() {
        
        addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setConstraint(from: .right, from: self, 0)
        button.setConstraint(from: .top, from: self, 0)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.tintColor = .rgb(154, 154, 158)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
    }
    
    private func setUpCollectionView() {
        
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.setConstraint(from: .left, from: self, 0)
        collectionView.setConstraint(from: .right, from: self, 0)
        collectionView.setConstraint(from: .bottom, from: self, -10)
        collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
    }
}

extension HomeSectionHeaderView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .rgb(240, 240, 251)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
    
        return cell
    }
}
