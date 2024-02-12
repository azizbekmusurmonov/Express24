//
//  ImageTitleView.swift
//  Express 24
//
//  Created by MacBook on 31/01/24.
//

import UIKit

final class ImageTitleView: UIStackView {
    let label = UILabel()
    let image = UIImageView()
    
    
    init(imageName: String, titleName: String) {
        super.init(frame: .zero)
        label.text = titleName
        label.font = .systemFont(ofSize: 14)

        image.image = .init(named: imageName)
        image.tintColor = .black
        
        image.setConstraint(from: .width, from: self, 15)
        image.setConstraint(from: .height, from: self, 15)
        addArrangedSubview(image)
        addArrangedSubview(label)
        
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
