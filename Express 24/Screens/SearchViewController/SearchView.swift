//
//  SearchView.swift
//  Express 24
//
//  Created by MacBook on 31/01/24.
//

import UIKit

final class SearchView: UIView, UISearchResultsUpdating {
    
    private let segmentedControl = UISegmentedControl()
    let searchController = UISearchController(searchResultsController: nil)
    private let all = AllView()
    private let restaurant = RestaurantView()
    private let shop = ShopView()
    
    init() {
        super.init(frame: .zero)
        
        //MARK: - functions

        setSegment()
        allView()
        restaurantView()
        shopView()
        
        //MARK: - search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Izlash"
        
        searchController.searchBar.setValue("Bekor qilish", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = UIColor.black
        searchController.searchBar.searchTextField.backgroundColor = .white
        
        
        
        
        addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(tappedToView))
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extension segmentControl
extension SearchView {
    func setSegment() {
        
        addSubview(segmentedControl)
        segmentedControl.insertSegment(withTitle: "Barcha", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Restoranlar", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: "Do'konlar", at: 2, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(changeViews), for: .valueChanged)
        
        
        segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        segmentedControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    func allView() {
        
        addSubview(all)
        
        all.translatesAutoresizingMaskIntoConstraints = false
        
        all.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        all.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        all.topAnchor.constraint(equalTo: topAnchor, constant: 230).isActive = true
        all.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    func restaurantView() {
        addSubview(restaurant)
        
        restaurant.translatesAutoresizingMaskIntoConstraints = false
        restaurant.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        restaurant.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        restaurant.topAnchor.constraint(equalTo: topAnchor, constant: 230).isActive = true
        restaurant.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    func shopView(){
        addSubview(shop)
        
        shop.translatesAutoresizingMaskIntoConstraints = false
        shop.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        shop.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        shop.topAnchor.constraint(equalTo: topAnchor, constant: 230).isActive = true
        shop.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    //MARK: - @objc functions
    @objc func changeViews() {
        all.isHidden = segmentedControl.selectedSegmentIndex == 2
        restaurant.isHidden = segmentedControl.selectedSegmentIndex == 1
        shop.isHidden = segmentedControl.selectedSegmentIndex == 0
    }
    @objc func tappedToView() {
        endEditing(true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text?.lowercased() {
            
        }
    }
}

