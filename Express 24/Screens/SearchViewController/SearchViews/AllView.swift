//
//  AllView.swift
//  Express 24
//
//  Created by MacBook on 17/01/24.
//

import UIKit

final class AllView: UIView {
    
    private let tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(tableView)
        setupTableView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.register(AllViewCell.self, forCellReuseIdentifier: "allViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension AllView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 10 }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat { return 90 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "allViewCell",
                                                       for: indexPath) as? AllViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = true
        cell.titleLabel.text = "Oshxona"
//        cell.shopImageView.image = UIImage(named: "")
        cell.imageNext.image = UIImage(named: "next")
       
        return cell
    }
}
