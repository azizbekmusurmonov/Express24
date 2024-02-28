//
//  MyLocationVC.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 15/02/24.
//

import UIKit
import Combine

final class MyLocationVC: UIViewController {
    
    private let tableView = UITableView()
    private let animator = UIActivityIndicatorView(style: .large)
    
    private let viewModel = MyLocationViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    var data: [MyLocationModel] = []
    
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
        
        view.addSubview(animator)
        
        animator.center = view.center
        animator.startAnimating()
        
        
        viewModel.$location.sink { recivedModel in
            self.data = recivedModel
            self.tableView.reloadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.animator.stopAnimating()
            }
        }.store(in: &cancellables)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { data.count + 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "myLocationVCCell",
            for: indexPath
        ) as? MyLocationVCCell else {
            return UITableViewCell()
        }
        
        // Check if the index is within the bounds of the data array
        if indexPath.row < data.count {
            // Access the element from the data array
            let location = data[indexPath.row]
            
            // Configure the cell with location data
//            cell.locationName.text = "Yunusobod tumani, Amir Temur Shoh ko'chasi"
            cell.image.image = UIImage(named: "edit_phone")
            cell.textLabel?.text = location.name
            cell.detailTextLabel?.text = location.username
        } else {
            // Handle the case when the index is out of bounds
            print("Index out of range for indexPath: \(indexPath)")
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }
}
 
