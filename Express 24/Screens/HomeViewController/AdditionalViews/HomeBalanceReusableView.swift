//
//  MainBalanceReusableView.swift
//  Express 24
//
//  Created by MacBook on 27/01/24.
//

import UIKit

protocol HomeBalanceReusableViewDelegate: AnyObject {
    func settingsButtonTapped()
}

final class HomeBalanceReusableView: UICollectionReusableView {
    
    let titleLabel = UILabel()
    let totalBalanceButton = UIButton(type: .system)
    let balanceButton = UIButton(type: .system)
    let settingsButton = UIButton(type: .system)
    let seeButton = UIButton(type: .system)
    
    weak var delegate: HomeBalanceReusableViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpTitleLabel()
        setUpTotalBalanceButton()
        setUpBalanceButton()
        setUpSettingsButton()
        setUpSeeButton()
    }
    
    @objc private func settingsButtonTapped(_ sender: UIButton) {
        delegate?.settingsButtonTapped()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeBalanceReusableView {
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint( from: .top, from: self, 40)
        titleLabel.setConstraint(from: .left, from: self, 16)
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14)
    }
    
    private func setUpTotalBalanceButton() {
        
        addSubview(totalBalanceButton)
        
        totalBalanceButton.setConstraint(from: .left, from: self, 16)
        totalBalanceButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        totalBalanceButton.setConstraint(from: .height, from: self, 30)
        totalBalanceButton.setConstraint(from: .width, from: self, 30)
        totalBalanceButton.tintColor = .white
        settingsButton.isUserInteractionEnabled = true
    }
    
    private func setUpBalanceButton() {
        
        addSubview(balanceButton)
        
        balanceButton.setConstraint(from: .height, from: self, 20)
        balanceButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14).isActive = true
        balanceButton.leadingAnchor.constraint(equalTo: totalBalanceButton.trailingAnchor, constant: 0).isActive = true
        balanceButton.titleLabel?.font = .boldSystemFont(ofSize: 25)
        balanceButton.tintColor = .white
    }
    
    private func setUpSettingsButton() {
        addSubview(settingsButton)
        
        settingsButton.setConstraint(from: .top, from: self, 65)
        settingsButton.setConstraint(from: .right, from: self, 16)
        settingsButton.setConstraint(from: .height, from: self, 30)
        settingsButton.setConstraint(from: .width, from: self, 30)
        settingsButton.tintColor = .white
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
    }
    
    private func setUpSeeButton() {
        
        addSubview(seeButton)
        
        seeButton.setConstraint(from: .top, from: self, 65)
        seeButton.setConstraint(from: .height, from: self, 30)
        seeButton.setConstraint(from: .width, from: self, 30)
        seeButton.trailingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: -10).isActive = true
        seeButton.tintColor = .white
    }
}
