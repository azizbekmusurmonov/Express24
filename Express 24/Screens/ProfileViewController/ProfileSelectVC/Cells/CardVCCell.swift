//
//  CardVCCell.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 16/02/24.
//

import UIKit

final class CardVCCell: UITableViewCell {
    
     let cellView = UIView()
     var imageViewCard = UIImageView()
     var cardNumber = UILabel()
     var imageDelete = UIImageView()
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        cellView.addSubview(imageViewCard)
        imageViewCard.translatesAutoresizingMaskIntoConstraints = false
        imageViewCard.setConstraint(from: .left, from: cellView, 16)
        imageViewCard.setConstraint(from: .yCenter, from: cellView)
        
        cellView.addSubview(cardNumber)
        cardNumber.translatesAutoresizingMaskIntoConstraints = false
        cardNumber.leadingAnchor.constraint(equalTo: imageViewCard.trailingAnchor, constant: 16).isActive = true
        cardNumber.setConstraint(from: .yCenter, from: cellView)
        
        cellView.addSubview(imageDelete)
        imageDelete.translatesAutoresizingMaskIntoConstraints = false
        imageDelete.setConstraint(from: .right, from: cellView, -16)
        imageDelete.setConstraint(from: .yCenter, from: cellView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
