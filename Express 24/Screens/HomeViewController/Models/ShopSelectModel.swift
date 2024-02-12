//
//  ShopSelectModel.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 11/02/24.
//

struct ShopSelectModel {
    let id: Int
    let imageUrl: String
    let shopNameLabel: String
    let contentLabel: String
}

struct ShopsModel {
    let shopSelect: [ShopSelectModel]
}
