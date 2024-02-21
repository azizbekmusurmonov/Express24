//
//  TermsOfUseVC.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 19/02/24.
//

import UIKit
import WebKit

final class TermsOfUseVC: UIViewController {
   
    let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray.withAlphaComponent(0.35)
        
        let tappedBackview = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tappedBackview.numberOfTapsRequired = 1
        view.addGestureRecognizer(tappedBackview)

        view.addSubview(webView)
        webView.load(URLRequest(url: URL(string: "https://apple.com")!))
        
        
    }
    
    @objc func tapped() {
        dismiss(animated: true)
    }
}
