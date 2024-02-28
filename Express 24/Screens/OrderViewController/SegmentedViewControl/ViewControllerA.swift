//
//  ViewControllerA.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 09/02/24.
//

import UIKit

final class ViewControllerA: UIViewController {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.setConstraint(from: .top, from: view)
        tableView.setConstraint(from: .left, from: view)
        tableView.setConstraint(from: .right, from: view)
        tableView.setConstraint(from: .bottom, from: view)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}


extension ViewControllerA: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: String(describing: "cell"))
            cell.textLabel?.text = "tableContent[indexPath.row]"
            cell.detailTextLabel?.text = "tableDetailContent[indexPath.row]"

        
        return cell
    }
    
    
}
