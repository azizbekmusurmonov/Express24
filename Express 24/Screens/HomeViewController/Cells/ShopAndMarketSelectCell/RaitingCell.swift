//
//  RaitingCell.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 10/02/24.
//

import UIKit

final class RaitingCell: UICollectionViewCell {
    
    let cellView = UIView()
    var raightingTitle = UILabel()
    var labelCell = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.setConstraint(from: .left, from: contentView, 5)
        cellView.setConstraint(from: .right, from: contentView, -5)
        cellView.setConstraint(from: .top, from: contentView, 5)
        cellView.setConstraint(from: .bottom, from: contentView, -5)
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = .white
        
        cellView.addSubview(raightingTitle)
        raightingTitle.setConstraint(from: .left, from: cellView, 16)
        raightingTitle.setConstraint(from: .top, from: cellView, 16)
        raightingTitle.font = .boldSystemFont(ofSize: 20)
        
        cellView.addSubview(labelCell)
        labelCell.translatesAutoresizingMaskIntoConstraints = false
        labelCell.setConstraint(from: .left, from: cellView, 16)
        labelCell.topAnchor.constraint(equalTo: raightingTitle.bottomAnchor).isActive = true
        labelCell.font = .systemFont(ofSize: 18)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
