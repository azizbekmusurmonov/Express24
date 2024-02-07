//
//  UIImage.swift
//  Express 24
//
//  Created by MacBook on 29/01/24.
//

import UIKit

extension UIImageView {
    func downloaded(from urlString: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let imageURL = URL(string: urlString) else { return }
        contentMode = mode
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
