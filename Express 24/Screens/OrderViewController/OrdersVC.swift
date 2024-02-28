//
//  OrdersVC.swift
//  Express 24
//
//  Created by MacBook on 15/01/24.
//
import UIKit
import Combine

final class OrdersVC: UIViewController {
    
    private let tableView = UITableView()
    private let animator = UIActivityIndicatorView(style: .large)
    
    private let viewModel = OrdersViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    var data: [OrdersModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        title = "Combine"
        tableView.setConstraint(from: .top, from: view)
        tableView.setConstraint(from: .left, from: view)
        tableView.setConstraint(from: .right, from: view)
        tableView.setConstraint(from: .bottom, from: view)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(animator)
        
        animator.center = view.center
        animator.startAnimating()
        
        
        viewModel.$orders.sink { recivedModel in
            self.data = recivedModel
            self.tableView.reloadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.animator.stopAnimating()
            }
        }.store(in: &cancellables)
    }
}


extension OrdersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: String(describing: "cell"))
        cell.textLabel?.text = data[indexPath.row].title
        cell.detailTextLabel?.text = data[indexPath.row].body
        cell.imageView?.image = .init(systemName: "iphone")
        
        return cell
    }
    
    
}
