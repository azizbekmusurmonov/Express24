//
//  ProfileView.swift
//  Express 24
//
//  Created by MacBook on 31/01/24.
//

import UIKit

final class ProfileView: UIView {

    let tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        addSubview(tableView)
        
        tableView.frame = frame
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(InformationCell.self, forCellReuseIdentifier: "informationCell")
        tableView.register(CartAdressCell.self, forCellReuseIdentifier: "cartAdressCell")
        tableView.register(SettingCell.self, forCellReuseIdentifier: "settingCell")
        tableView.register(ReferenceCell.self, forCellReuseIdentifier: "referenceCell")
        tableView.register(DeleteAccCell.self, forCellReuseIdentifier: "deleteAccCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
