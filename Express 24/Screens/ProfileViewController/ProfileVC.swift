//
//  ProfileVC.swift
//  Express 24
//
//  Created by MacBook on 15/01/24.
//
import UIKit

enum ProfileSectionType: Int, CaseIterable {
    case information
    case cartAdress
    case setting
    case reference
    case deleteAcc
}

final class ProfileVC: UIViewController {

    private let profileView = ProfileView()
    private let presenter: ProfileViewPresenterable
    
    init() {
        self.presenter = ProfilePresenter() // Corrected from OrdersPresenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profil"
        
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileSectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.cellForRaw(tableView, at: indexPath)
    }
}
