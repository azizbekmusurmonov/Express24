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
    let thumbnailImageView = UIImageView()
    let resultLabel = UILabel()
    let imageNext = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(thumbnailImageView)
        cellView.addSubview(resultLabel)
        cellView.addSubview(imageNext)
        
        setupConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .red
        cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 21).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: imageNext.leadingAnchor, constant: -10).isActive = true
        
        thumbnailImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 9).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 15).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: imageNext.leadingAnchor, constant: -10).isActive = true
        
        imageNext.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        imageNext.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10).isActive = true
        imageNext.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageNext.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    private func configureUI() {
        resultLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        thumbnailImageView.layer.cornerRadius = 30
        thumbnailImageView.backgroundColor = .rgb(255, 206, 50)
    }
}
