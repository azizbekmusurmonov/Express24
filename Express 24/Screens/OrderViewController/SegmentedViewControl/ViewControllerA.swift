//
//  ViewControllerA.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 09/02/24.
//

import UIKit

final class ViewControllerA: UIViewController {
    
    private let imageView = UIView()
    private var imageLabel = UILabel()
    private var imageTagLabel = UILabel()
    private let imageEmpty = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setConstraint(from: .left, from: view, 60)
        imageView.setConstraint(from: .right, from: view, -60)
        imageView.setConstraint(from: .top, from: view, 140)
        imageView.setConstraint(from: .bottom, from: view, -140)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10

        imageView.addSubview(imageLabel)
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.setConstraint(from: .top, from: imageView, 16)
        imageLabel.setConstraint(from: .xCenter, from: view)
        imageLabel.text = "Ro'yxat bo'sh"
        imageLabel.font = .systemFont(ofSize: 25)
        
        imageView.addSubview(imageTagLabel)
        imageTagLabel.translatesAutoresizingMaskIntoConstraints = false
        imageTagLabel.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 5).isActive = true
        imageTagLabel.setConstraint(from: .xCenter, from: view)
        imageTagLabel.text = "Faol buyurtmalar mavjud emas"
        imageTagLabel.textColor = .rgb(175, 175, 175)
        imageLabel.font = .systemFont(ofSize: 20)
        
        imageView.addSubview(imageEmpty)
        imageEmpty.translatesAutoresizingMaskIntoConstraints = false
        imageEmpty.setConstraint(from: .yCenter, from: imageView, 10)
        imageEmpty.setConstraint(from: .xCenter, from: imageView)
        imageEmpty.image = UIImage(named: "empty_bag")
    }
}
