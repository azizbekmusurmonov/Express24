//
//  OrderSelectCell.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 10/02/24.
//

import UIKit

final class OrderSelectCell: UICollectionViewCell {
    
    let cellView = UIView()
    var cellTitle = UILabel()
    let imageView = UIImageView()
    let button = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.setConstraint(from: .left, from: contentView, 16)
        cellView.setConstraint(from: .right, from: contentView, -16)
        cellView.setConstraint(from: .top, from: contentView, 5)
        cellView.setConstraint(from: .bottom, from: contentView, -5)
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = .systemGray6
        
        cellView.addSubview(imageView)
        imageView.setConstraint(from: .left, from: cellView, 10)
        imageView.setConstraint(from: .yCenter, from: cellView)
        imageView.image = UIImage(named: "ic_group_green")
        
        cellView.addSubview(button)
        button.setConstraint(from: .right, from: cellView, -16)
        button.setConstraint(from: .yCenter, from: cellView)
        button.setConstraint(from: .width, from: cellView, 80)
        button.setConstraint(from: .height, from: cellView, 40)
        button.layer.cornerRadius = 10
        button.backgroundColor = .rgb(92, 195, 89)
        button.setTitle("Boshlash", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        cellView.addSubview(cellTitle)
        cellTitle.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        cellTitle.setConstraint(from: .yCenter, from: cellView)
        cellTitle.font = .boldSystemFont(ofSize: 20)
        cellTitle.text = "Birgalikda buyurtma"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
