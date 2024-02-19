//
//  HomeSectionHeaderViewCell.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 19/02/24.
//

import UIKit

final class HomeSectionHeaderViewCell: UICollectionViewCell {
    
    let cellView = UIView()
    var nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.setConstraint(from: .left, from: contentView)
        cellView.setConstraint(from: .right, from: contentView)
        cellView.setConstraint(from: .top, from: contentView)
        cellView.setConstraint(from: .bottom, from: contentView)
        
        
        cellView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.setConstraint(from: .yCenter, from: cellView)
        nameLabel.setConstraint(from: .xCenter, from: cellView)
        nameLabel.font = .systemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
