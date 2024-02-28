//
//  OrdersModel.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 21/02/24.
//

import Foundation

struct OrdersModel: Codable {
    let userId, id: Int
    let title, body: String
}
