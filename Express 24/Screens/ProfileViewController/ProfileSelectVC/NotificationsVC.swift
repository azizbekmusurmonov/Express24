//
//  NotificationsVC.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 15/02/24.
//

import UIKit

final class NotificationsVC: UIViewController {
    
    private let imageView = UIImageView()
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Bildirishnomalar"
        
        let leftButton = UIBarButtonItem(
            image: UIImage(named: "ic_back_arrow"),
            style: .plain,
            target: self,
            action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton // Assign leftButton to leftBarButtonItem
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setConstraint(from: .yCenter, from: view)
        imageView.setConstraint(from: .xCenter, from: view)
        imageView.image = UIImage(named: "pic_notification")
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        label.setConstraint(from: .xCenter, from: view)
        label.text = "Sizda hech qanday bildirishnoma yo'q"
        label.textColor = .rgb(142, 142, 147)
        label.font = .systemFont(ofSize: 20)
    
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
}
