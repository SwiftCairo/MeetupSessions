//
//  APIRouter.swift
//  SixtCars
//
//  Created by Hesham on 6/18/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    case getProperties
    
    //MARK: - Request Parameters
    var method: HTTPMethod {
        switch self {
        case .getProperties:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getProperties:
            return Config.EndpointsPaths.properties
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getProperties:
            return nil
        }
    }
    
    //MARK: - Convert to URLRequest
    func asURLRequest() throws -> URLRequest {
        let url = try Config.apiBaseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
