//
//  BasketVC.swift
//  Express 24
//
//  Created by MacBook on 15/01/24.
//
//import UIKit
//
//final class BasketVC: UIViewController {
//
//    private let basketView = BasketView()
//    private let presenter: BasketViewPresenterable
//    
//    init() {
//        self.presenter = BasketPresenter()
//        
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Savat"
//    }
//}

import UIKit

class BasketVC: UIViewController {

    // openNewViewButton ni o'zgartiring
    private var openNewViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Yangi Ko'rinishni Ochish", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // openNewViewButton ni view dan olib tashlang
        openNewViewButton.addTarget(self, action: #selector(openNewView), for: .touchUpInside)
        view.addSubview(openNewViewButton)

        // openNewViewButton ga constraintlarni qo'yish
        NSLayoutConstraint.activate([
            openNewViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openNewViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openNewViewButton.widthAnchor.constraint(equalToConstant: 200),
            openNewViewButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func openNewView() {
        // Yangi ko'rinishni ochish
        let basketView = BasketView()
        navigationController?.pushViewController(basketView, animated: true)
    }
}
