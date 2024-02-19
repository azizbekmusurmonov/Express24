//
//  InformationVC.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 15/02/24.
//

import UIKit

final class InformationVC: UIViewController {
    
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Ma'lumotlarim"
        
        //MARK: - functions
        setScrollView()
        setStackView()
        addTextFieldsToStackView()
        setSaveButton()
        
        // Set up left button
        let leftButton = UIBarButtonItem(
            image: UIImage(named: "ic_back_arrow"),
            style: .plain,
            target: self,
            action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton // Assign leftButton to leftBarButtonItem
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

extension InformationVC {
    
    private func setScrollView() {
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.setConstraint(from: .top, from: view)
        scrollView.setConstraint(from: .left, from: view)
        scrollView.setConstraint(from: .right, from: view)
        scrollView.setConstraint(from: .bottom, from: view)
    }
    
    private func setStackView() {
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        stackView.axis = .vertical // Vertical alignment (stacked vertically)
        stackView.alignment = .fill // Align items to fill the available width horizontally
        stackView.distribution = .fillEqually // Distribute items evenly along the stack
        stackView.spacing = 20 // Spacing between items
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 50, left: 16, bottom: 50, right: 16)
    }

    
    private func addTextFieldsToStackView() {
        let textFieldName = UITextField()
        textFieldName.placeholder = "   Ism"
        textFieldName.layer.borderWidth = 0.5
        textFieldName.layer.borderColor = UIColor.black.cgColor
        textFieldName.layer.cornerRadius = 8
        stackView.addArrangedSubview(textFieldName)
        
        let textFieldSurName = UITextField()
        textFieldSurName.placeholder = "    Familiya"
        textFieldSurName.layer.borderWidth = 0.5
        textFieldSurName.layer.borderColor = UIColor.black.cgColor
        textFieldSurName.layer.cornerRadius = 8
        stackView.addArrangedSubview(textFieldSurName)
        
        let textFieldBirthday = UITextField()
        textFieldBirthday.placeholder = "   Tug'ilgan sana"
        textFieldBirthday.layer.borderWidth = 0.5
        textFieldBirthday.layer.borderColor = UIColor.black.cgColor
        textFieldBirthday.layer.cornerRadius = 8
        stackView.addArrangedSubview(textFieldBirthday)
    }
    
    private func setSaveButton() {
        let button = UIButton()
        button.setTitle("Saqlash", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        stackView.addArrangedSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50) // Set a fixed height for the button
        ])
    }
}
