//
//  PropertiesListViewModel.swift
//  MVVMSample
//
//  Created by Hesham on 6/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation

protocol PropertiesViewModelDelegate: class {
    func viewModelLoadedProperties(with properties: Properties)
    func viewModelFailedToLoadProperties(with error: Error)
}

class PropertiesListViewModel {
    var properties = [PropertyViewModel]()
    weak var delegate: PropertiesViewModelDelegate?
    
    func getProperties() {
        APIClient.getProperties { (result) in
            switch result {
            case .success(let properties):
                self.delegate?.viewModelLoadedProperties(with: properties)
            case .failure(let error):
                self.delegate?.viewModelFailedToLoadProperties(with: error)
            }
        }
    }
}
