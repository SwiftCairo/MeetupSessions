//
//  Properties.swift
//  MVVMSample
//
//  Created by Hesham on 6/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation

struct AProperty: Codable {
    var id: Int?
    var title: String?
    var subject: String?
    var type: String?
    var imageURL: String?
    var price: String?
}

extension AProperty {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case subject
        case type
        case imageURL = "thumbnail_big"
        case price
    }
}
