//
//  CategoryCell.swift
//  Express 24
//
//  Created by MacBook on 17/01/24.
//

import UIKit

final class BannerCell: UICollectionViewCell {
    
    let cellView = UIView()
    let imageView = UIImageView()
    var index = 0
    private var imageIndex = 0
    private var imageTimer: Timer?
    private let imageSwitchingInterval: TimeInterval = 3.0
    private var imageNames: [String] = [
        "banner1", "banner2", "banner3"
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellView)
        
        cellView.addSubview(imageView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        cellView.layer.cornerRadius = 5
        cellView.backgroundColor = .systemGray6
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setConstraint(from: .left, from: cellView, 0)
        imageView.setConstraint(from: .right, from: cellView, 0)
        imageView.setConstraint(from: .top, from: cellView, 0)
        imageView.setConstraint(from: .bottom, from: cellView, 0)
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
    }
    
    func prepare(data: BannerModel, index: Int) {
        self.index = index
        if !data.imageUrl.isEmpty {
            self.imageNames = [data.imageUrl]
        } else {
            
        }
        self.imageView.image = UIImage(named: data.imageUrl)
        //self.imageView.downloaded(from: data.imageUrl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startImageAnimation() {
        imageTimer = Timer.scheduledTimer(
            timeInterval: imageSwitchingInterval,
            target: self,
            selector: #selector(switchToNextImage),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stopImageAnimation() {
        imageTimer?.invalidate()
        imageTimer = nil
    }
    
    @objc private func switchToNextImage() {
        let currentImageIndex = imageIndex
        imageIndex += 1
        if imageIndex >= imageNames.count {
            imageIndex = 0
        }
        
        let currentImageView = UIImageView(image: imageView.image)
        let nextImageName = imageNames[imageIndex]
        let nextImageView = UIImageView(image: UIImage(named: nextImageName))
        
        currentImageView.frame = bounds
        nextImageView.frame = CGRect(x: bounds.width, y: 0, width: bounds.width, height: bounds.height)
        
        addSubview(currentImageView)
        addSubview(nextImageView)
        
        UIView.animate(withDuration: 0.5, animations: {
            currentImageView.frame.origin.x = -self.bounds.width
            nextImageView.frame.origin.x = 0
        }) { (_) in
            currentImageView.removeFromSuperview()
            nextImageView.removeFromSuperview()
            
            if currentImageIndex != self.imageIndex {
                
                self.imageView.image = UIImage(named: nextImageName)
            }
        }
    }
}
