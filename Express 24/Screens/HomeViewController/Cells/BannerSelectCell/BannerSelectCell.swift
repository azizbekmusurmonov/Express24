//
//  BannerSelectCell.swift
//  Express 24
//
//  Created by MacBook on 02/02/24.
//

import UIKit

final class BannerSelectCell: UICollectionViewCell {
    
    let cellView = UIView()
    let imageView = UIImageView()
    var shopNameLabel = UILabel()
    var contentLabel = UILabel()
    let likeButton = UIButton()
    
    let ratingView = ImageTitleView(imageName: "ic_rating", titleName: "4.8(500)+")
    let carView = ImageTitleView(imageName: "ic_courier_20", titleName: "Bepul")

    var isLiked = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellView)
        cellView.addSubview(imageView)
        cellView.addSubview(shopNameLabel)
        cellView.addSubview(contentLabel)
        cellView.addSubview(likeButton)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.setConstraint(from: .left, from: contentView, 5)
        cellView.setConstraint(from: .right, from: contentView, -5)
        cellView.setConstraint(from: .top, from: contentView, 5)
        cellView.setConstraint(from: .bottom, from: contentView, -5)
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = .systemGray6
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setConstraint(from: .left, from: cellView, 0)
        imageView.setConstraint(from: .right, from: cellView, 0)
        imageView.setConstraint(from: .height, from: cellView, 190)
        imageView.layer.cornerRadius = 14
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        shopNameLabel.translatesAutoresizingMaskIntoConstraints = false
        shopNameLabel.setConstraint(from: .left, from: cellView, 5)
        shopNameLabel.setConstraint(from: .right, from: cellView, 0)
        shopNameLabel.setConstraint(from: .bottom, from: imageView, 40)
        shopNameLabel.adjustsFontSizeToFitWidth = true
        shopNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.setConstraint(from: .left, from: cellView, 5)
        contentLabel.setConstraint(from: .right, from: imageView, 0)
        contentLabel.topAnchor.constraint(
            equalTo: shopNameLabel.bottomAnchor).isActive = true
        contentLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentLabel.textColor = .rgb(142, 142, 147)
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, 
                                             constant: -10).isActive = true
        likeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                        constant: 0).isActive = true
        likeButton.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"),
                            for: .normal)
        likeButton.tintColor = isLiked ? .red : .black
        likeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        likeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cellView.addSubview(ratingView)
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.setConstraint(from: .left, from: self, 16)
        ratingView.setConstraint(from: .bottom, from: self, -16)
        ratingView.backgroundColor = .rgb(242, 242, 256)
        
        cellView.addSubview(carView)
        carView.translatesAutoresizingMaskIntoConstraints = false
        carView.leadingAnchor.constraint(equalToSystemSpacingAfter: ratingView.trailingAnchor,
                                         multiplier: 2).isActive = true
        carView.setConstraint(from: .bottom, from: self, -16)
        carView.backgroundColor = .rgb(252, 236, 79)
    }
    
    func prepare(data: BannerSelectModel) {
        self.imageView.image = UIImage(named: data.imageUrl)
        //self.imageView.downloaded(from: data.imageUrl)
        self.shopNameLabel.text = data.shopNameLabel
        self.contentLabel.text = data.contentLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        isLiked.toggle()
        
        likeButton.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"), for: .normal)
        likeButton.tintColor = isLiked ? .red : .black
    }
}
