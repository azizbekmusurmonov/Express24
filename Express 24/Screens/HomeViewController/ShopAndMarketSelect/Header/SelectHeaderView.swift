//
//  SelectHeaderView.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 10/02/24.
//

import UIKit

final class SelectHeaderView: UICollectionReusableView {
    
    let header: UILabel = {
        let label = UILabel()
        label.text = "Turkumlar"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        header.font = .boldSystemFont(ofSize: 28)
        header.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
