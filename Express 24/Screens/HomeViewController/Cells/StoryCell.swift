//
//  StoryCell.swift
//  Express 24
//
//  Created by MacBook on 24/01/24.
//

import UIKit

final class StoryCell: UICollectionViewCell {
    
    let cellView = UIView()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellView)
        
        cellView.addSubview(imageView)
        
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
        imageView.setConstraint(from: .height, from: cellView, 120)
        imageView.layer.cornerRadius = 14
    }
    func prepare(data: StoryModel) {
        self.imageView.image = UIImage(named: data.imageUrl)
        //self.imageView.downloaded(from: data.imageUrl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
