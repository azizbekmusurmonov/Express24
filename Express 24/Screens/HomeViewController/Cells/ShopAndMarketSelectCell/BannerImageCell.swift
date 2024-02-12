//
//  BannerImageCell.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 10/02/24.
//

import UIKit

final class BannerImageCell: UICollectionViewCell {
    
        let cellView = UIView()
//        let imageView = UIImageView()
//        var imageName = UILabel()
//        var minPrice = UILabel()
//        let likeButton = UIButton()
//        var isLiked = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellView)
//        cellView.addSubview(imageView)
//        cellView.addSubview(imageName)
//        cellView.addSubview(minPrice)
//        cellView.addSubview(likeButton)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.setConstraint(from: .left, from: contentView, 5)
        cellView.setConstraint(from: .right, from: contentView, -5)
        cellView.setConstraint(from: .top, from: contentView, 5)
        cellView.setConstraint(from: .bottom, from: contentView, -5)
//        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = .systemGray6
        
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.setConstraint(from: .left, from: cellView, 0)
//        imageView.setConstraint(from: .right, from: cellView, 0)
//        imageView.setConstraint(from: .height, from: cellView, 190)
//        imageView.layer.cornerRadius = 14
//        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        
//        imageName.translatesAutoresizingMaskIntoConstraints = false
//        imageName.setConstraint(from: .left, from: cellView, 5)
//        imageName.setConstraint(from: .right, from: cellView, 0)
//        imageName.setConstraint(from: .bottom, from: imageView, 40)
//        imageName.adjustsFontSizeToFitWidth = true
//        imageName.font = UIFont.boldSystemFont(ofSize: 25)
//        
//        minPrice.translatesAutoresizingMaskIntoConstraints = false
//        minPrice.setConstraint(from: .left, from: cellView, 5)
//        minPrice.setConstraint(from: .right, from: imageView, 0)
//        minPrice.topAnchor.constraint(
//            equalTo: imageName.bottomAnchor).isActive = true
//        minPrice.font = UIFont.boldSystemFont(ofSize: 16)
//        minPrice.textColor = .rgb(142, 142, 147)
//        
//        likeButton.translatesAutoresizingMaskIntoConstraints = false
//        likeButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor,
//                                             constant: -10).isActive = true
//        likeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor,
//                                        constant: -27).isActive = true
//        likeButton.backgroundColor = .white
//        likeButton.layer.cornerRadius = 24
//        likeButton.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"),
//                            for: .normal)
//        likeButton.tintColor = isLiked ? .red : .black
//        likeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        likeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        likeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        likeButton.layer.backgroundColor = UIColor.white.cgColor
//        likeButton.layer.cornerRadius = 24
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//        @objc func buttonTapped() {
//    
//            isLiked.toggle()
//    
//            likeButton.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"), for: .normal)
//            likeButton.tintColor = isLiked ? .red : .black
//        }
}
