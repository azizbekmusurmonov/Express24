//
//  AllViewCell.swift
//  Express 24
//
//  Created by MacBook on 31/01/24.
//

import UIKit

final class AllViewCell: UITableViewCell {
    
    let cellView = UIView()
    let titleLabel = UILabel()
    let shopImageView = UIImageView()
    let resultLabel = UILabel()
    let imageNext = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(shopImageView)
        cellView.addSubview(imageNext)
        
        setupConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .orange
        cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        cellView.backgroundColor = .systemGray6
        cellView.layer.cornerRadius = 10
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: shopImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: imageNext.leadingAnchor, constant: -10).isActive = true
        
        shopImageView.translatesAutoresizingMaskIntoConstraints = false
        shopImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 0).isActive = true
        shopImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 15).isActive = true
        shopImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        shopImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        imageNext.translatesAutoresizingMaskIntoConstraints = false
        imageNext.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        imageNext.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10).isActive = true
        imageNext.setConstraint(from: .height, from: self, 15)
        imageNext.setConstraint(from: .width, from: self, 10)
        
    }
    
    private func configureUI() {
        resultLabel.font = UIFont.boldSystemFont(ofSize: 20)
        shopImageView.layer.cornerRadius = 8
        shopImageView.backgroundColor = .rgb(255, 206, 50)
    }
}
