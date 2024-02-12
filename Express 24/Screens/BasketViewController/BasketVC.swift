//
//  BasketView.swift
//  Express 24
//
//  Created by MacBook on 31/01/24.
//

//import UIKit
//
//final class BasketView: UIView {
//
//    
//    init() {
//        super.init(frame: .zero)
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
import UIKit

final class BasketVC: UIViewController {

    let backButton = UIButton()
    private let imageView = UIImageView()
    private let imageLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Savat"
        
//        let leftButton = UIBarButtonItem(title: UIImage(named: "ic_back_arrow"),
//                                         style: .plain, target: self, action: #selector(backButtonTapped))
        let leftButton = UIBarButtonItem(image: UIImage(named: "ic_back_arrow"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        view.addSubview(backButton)
        backButton.setTitle("Asosiy sahifaga qaytish", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.layer.cornerRadius = 10
        backButton.setConstraint(from: .left, from: view, 16)
        backButton.setConstraint(from: .right, from: view, -16)
        backButton.setConstraint(from: .bottom, from: view, -30)
        backButton.setConstraint(from: .height, from: view, 60)
        backButton.backgroundColor = .rgb(236, 236, 241)
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setConstraint(from: .xCenter, from: view)
        imageView.setConstraint(from: .yCenter, from: view)
        imageView.image = UIImage(named: "pic_busket")
        
        view.addSubview(imageLabel)
        imageLabel.text = "Sizning savatingiz hali bo'sh"
        imageLabel.setConstraint(from: .xCenter, from: view)
        imageLabel.setConstraint(from: .bottom, from: view, -310)
        imageLabel.font = .boldSystemFont(ofSize: 20)
        imageLabel.textColor = .rgb(135, 135, 140)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        tabBarController?.tabBar.isHidden = false
    }

    @objc func backButtonTapped() {
        
        let presenter = HomePresenter()
        let home = HomeVC(presenter: presenter)
        navigationController?.pushViewController(home, animated: true)
        
//        if let homeViewController = navigationController?.viewControllers.first(where: { $0 is HomeVC }) {
//                    navigationController?.popToViewController(homeViewController, animated: true)
//                }

    }
}
