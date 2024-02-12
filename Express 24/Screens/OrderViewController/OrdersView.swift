//
//  OrdersView.swift
//  Express 24
//
//  Created by MacBook on 31/01/24.
//

import UIKit

final class OrdersView: UIView {
    
    let segmentedControl: UISegmentedControl = {
        let items = ["Faol buyurtmalar", "Buyurtmalar tarixi"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, 
                                              constant: 20).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, 
                                                  constant: 15).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, 
                                                   constant: -15).isActive = true
        segmentedControl.addTarget(self, 
                                   action: #selector(segmentedControlValueChanged(_:)), 
                                   for: .valueChanged)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        displayViewController(index: sender.selectedSegmentIndex)
    }
    
    private func displayViewController(index: Int) {
        
        switch index {
        case 0:
            let vc = ViewControllerA()
            displayContentController(content: vc)
        case 1:
            let vc = ViewControllerB()
            displayContentController(content: vc)
        default:
            break
        }
    }

    private func displayContentController(content: UIViewController) {
        addSubview(content.view)
        content.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            content.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            content.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            content.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            content.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        content.didMove(toParent: nil)
    }
}
