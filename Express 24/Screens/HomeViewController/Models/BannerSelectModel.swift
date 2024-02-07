//
//  BannerSelectModel.swift
//  Express 24
//
//  Created by MacBook on 02/02/24.
//

import Foundation

struct BannerSelectModel {
    let id: Int
    let imageUrl: String
    let shopNameLabel: String
    let contentLabel: String
}

struct BannersModel {
    let bannerSelect: [BannerSelectModel]
}
