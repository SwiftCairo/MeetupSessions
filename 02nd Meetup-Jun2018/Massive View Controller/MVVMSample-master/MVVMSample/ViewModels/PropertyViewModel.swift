//
//  PropertyViewModel.swift
//  MVVMSample
//
//  Created by Hesham on 6/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation

class PropertyViewModel {
    fileprivate var property: AProperty
    init(withProperty property: AProperty) {
        self.property = property
    }
}

extension PropertyViewModel {
    var id: Int {
        return property.id ?? 0
    }
    
    var title: String {
        return property.title ?? ""
    }
    
    var subject: String {
        return property.subject ?? ""
    }
    
    var type: String {
        return property.type ?? ""
    }
    
    var price: String {
        return property.price ?? ""
    }
    
    var imageURL: String {
        return property.imageURL ?? ""
    }
}
