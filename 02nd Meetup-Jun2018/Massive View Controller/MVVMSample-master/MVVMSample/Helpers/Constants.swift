//
//  Constants.swift
//  SixtCars
//
//  Created by Hesham on 6/18/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation

struct Config {
    static let apiBaseURL = "https://www.propertyfinder.ae/"
    
    struct EndpointsPaths {
        static let properties = "mobileapi"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
