//
//  Constrint.swift
//  Express 24
//
//  Created by MacBook on 22/01/24.
//

import UIKit

extension UIView {
    enum Anchor {
        case top
        case bottom
        case left
        case right
        case width
        case height
        case xCenter
        case yCenter
    }
    
    func setConstraint(from anchor: Anchor, from view: UIView, _ constraint: CGFloat = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        switch anchor {
        case .top:
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: constraint).isActive = true
        case .bottom:
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constraint).isActive = true
        case .left:
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraint).isActive = true
        case .right:
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constraint).isActive = true
        case .width:
            self.widthAnchor.constraint(equalToConstant: constraint).isActive = true
        case .height:
            self.heightAnchor.constraint(equalToConstant: constraint).isActive = true
        case .xCenter:
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        case .yCenter:
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }
}
