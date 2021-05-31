//
//  Package.swift
//  PerformaIT
//
//  Created by Julio Cezar de Souza on 30/05/21.
//

import Foundation



struct Package {
    let size: PackageSize
    let description: String
    let sizeDescription: String
    
    init(size: PackageSize, description: String, sizeDescription: String) {
        
        self.size = size
        self.description = description
        self.sizeDescription = sizeDescription
    }
}

enum PackageSize: String {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    case custom = "Custom"
}
