//
//  CategoriesSelectCell.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 10/02/24.
//

import UIKit

final class CategoriesSelectCell: UICollectionViewCell {
    
    let cellView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.setConstraint(from: .left, from: contentView, 5)
        cellView.setConstraint(from: .right, from: contentView, -5)
        cellView.setConstraint(from: .top, from: contentView, 5)
        cellView.setConstraint(from: .bottom, from: contentView, -5)
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
