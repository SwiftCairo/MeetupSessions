//
//  Properties.swift
//  MVVMSample
//
//  Created by Hesham on 6/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation

struct Properties: Codable {
    var total: Int
    var properties: [AProperty]
}

extension Properties {
    enum CodingKeys: String, CodingKey {
        case total
        case properties = "res"
    }
}
