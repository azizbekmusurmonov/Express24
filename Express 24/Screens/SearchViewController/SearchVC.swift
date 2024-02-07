//
//  SearchVC.swift
//  Express 24
//
//  Created by MacBook on 15/01/24.
//

import UIKit

final class SearchVC: UIViewController {
    
    private let searchView = SearchView()
    private let presenter: SearchViewPresenterable
    
    init() {
        self.presenter = SearchPresenter()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.searchController = searchView.searchController
        definesPresentationContext = true
    }
}
