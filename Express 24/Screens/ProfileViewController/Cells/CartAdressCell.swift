//
//  CartAdressCell.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 07/02/24.
//

import UIKit

final class CartAdressCell: UITableViewCell {
    
    let cellView = UIView()
    var nameLabel = UILabel()
    var cardImageView = UIImageView()
    var nextImageView = UIImageView()
    var titleHeaderLabel = UILabel()
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        cellView.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.setConstraint(from: .left, from: self, 16)
        cardImageView.setConstraint(from: .yCenter, from: self)
        
        cellView.addSubview(nextImageView)
        nextImageView.translatesAutoresizingMaskIntoConstraints = false
        nextImageView.setConstraint(from: .yCenter, from: self)
        nextImageView.setConstraint(from: .right, from: self, -15)
        nextImageView.setConstraint(from: .height, from: self, 15)
        nextImageView.setConstraint(from: .width, from: self, 10)
        nextImageView.tintColor = .rgb(150, 150, 154)
        
        cellView.addSubview(titleHeaderLabel)
        titleHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        titleHeaderLabel.setConstraint(from: .left, from: self, 16)
        titleHeaderLabel.setConstraint(from: .bottom, from: self, -5)
        titleHeaderLabel.font = .systemFont(ofSize: 18)
        titleHeaderLabel.textColor = .rgb(209, 209, 214)
        
        cellView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .rgb(10, 10, 10)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
