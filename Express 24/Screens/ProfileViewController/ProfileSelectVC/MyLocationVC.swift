//
//  MyLocationVC.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 15/02/24.
//

import UIKit

final class MyLocationVC: UIViewController {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Mening manzillarim"
        
        let leftButton = UIBarButtonItem(
            image: UIImage(named: "ic_back_arrow"),
            style: .plain,
            target: self,
            action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton // Assign leftButton to leftBarButtonItem
        
        //MARK: - functions
        setUpTableView()
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        tabBarController?.tabBar.isHidden = false
    }
    
    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyLocationVCCell.self, forCellReuseIdentifier: "myLocationVCCell")
    }
}

extension MyLocationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "myLocationVCCell",
            for: indexPath
        ) as? MyLocationVCCell else {
            return UITableViewCell()
            
        }
        cell.locationName.text = "Yunusobod tumani, Amir Temur Shoh ko'chasi"
        cell.image.image = UIImage(named: "edit_phone")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }
}
 
