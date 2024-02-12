//
//  OrdersPresenter.swift
//  Express 24
//
//  Created by MacBook on 31/01/24.
//

import UIKit

protocol OrdersViewPresenterable: AnyObject {
    func fetchOrders()
}

final class OrdersPresenter: OrdersViewPresenterable {
    func fetchOrders() {
        // Here you can implement the logic to fetch orders from your data source
        // For example, you can make network requests or fetch data from a local database
        // Once you have the orders, you can update the UI accordingly
    }
}
