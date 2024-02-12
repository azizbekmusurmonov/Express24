//
//  InformationCell.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 07/02/24.
//

import UIKit

final class InformationCell: UITableViewCell {
    
    let cellView = UIView()
    var nameLabel = UILabel()
    var numberLabel = UILabel()
    var bonusLabel = UILabel()
    var nextImageView = UIImageView()
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        cellView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .rgb(10, 10, 10)

        cellView.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        numberLabel.textColor = .rgb(142, 142, 147)
        
        cellView.addSubview(bonusLabel)
        bonusLabel.translatesAutoresizingMaskIntoConstraints = false
        bonusLabel.setConstraint(from: .left, from: self, 16)
        bonusLabel.setConstraint(from: .yCenter, from: self)
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .rgb(10, 10, 10)
        
        cellView.addSubview(nextImageView)
        nextImageView.translatesAutoresizingMaskIntoConstraints = false
        nextImageView.setConstraint(from: .yCenter, from: self)
        nextImageView.setConstraint(from: .right, from: self, -15)
        nextImageView.setConstraint(from: .height, from: self, 15)
        nextImageView.setConstraint(from: .width, from: self, 10)
        nextImageView.tintColor = .rgb(150, 150, 154)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
