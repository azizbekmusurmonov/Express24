//
//  MarketCell.swift
//  Express 24
//
//  Created by MacBook on 24/01/24.
//

import UIKit

final class MarketCell: UICollectionViewCell {
    
    let cellView = UIView()
    let imageView = UIImageView()
    var marketLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellView)
        cellView.addSubview(imageView)
        cellView.addSubview(marketLabel)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, 
                                          constant: 0).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                           constant: 0).isActive = true
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, 
                                      constant: 0).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, 
                                         constant: 0).isActive = true
        cellView.layer.cornerRadius = 5
        cellView.backgroundColor = .systemGray6
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setConstraint(from: .left, from: cellView, 0)
        imageView.setConstraint(from: .right, from: cellView, 0)
        imageView.setConstraint(from: .top, from: cellView, 0)
        imageView.setConstraint(from: .height, from: cellView, 80)
        imageView.layer.cornerRadius = 8
        
        marketLabel.translatesAutoresizingMaskIntoConstraints = false
        marketLabel.setConstraint(from: .top, from: imageView, 90)
        marketLabel.setConstraint(from: .left, from: imageView, 0)
        marketLabel.setConstraint(from: .right, from: imageView, 0)
    }
    
    func prepare(data: MarketModel) {
        self.imageView.image = UIImage(named: data.imageUrl)
        //self.imageView.downloaded(from: data.imageUrl)
        self.marketLabel.text = data.imageText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
