//
//  OrdersVC.swift
//  Express 24
//
//  Created by MacBook on 15/01/24.
//
import UIKit

final class OrdersVC: UIViewController {

    private let basketView = OrdersView()
    private let presenter: OrdersViewPresenterable
    
    init() {
        self.presenter = OrdersPresenter()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Buyurtmalar"
    }
}
