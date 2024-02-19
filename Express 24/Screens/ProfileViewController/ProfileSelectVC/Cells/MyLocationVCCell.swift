//
//  MyLocationVCCell.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 16/02/24.
//

import UIKit

final class MyLocationVCCell: UITableViewCell {
    
     let cellView = UIView()
     var locationName = UILabel()
     let image = UIImageView()
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        cellView.addSubview(locationName)
        locationName.translatesAutoresizingMaskIntoConstraints = false
        locationName.setConstraint(from: .left, from: cellView, 16)
        locationName.setConstraint(from: .yCenter, from: cellView)
        
        cellView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.setConstraint(from: .right, from: cellView, -16)
        image.setConstraint(from: .yCenter, from: cellView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
