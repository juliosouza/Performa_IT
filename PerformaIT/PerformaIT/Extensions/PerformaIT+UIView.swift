//
//  PerformaIT+UIView.swift
//  PerformaIT
//
//  Created by Julio Cezar de Souza on 30/05/21.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow() {
        // corner radius
        layer.cornerRadius = 5

        // border
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.systemGray4.cgColor

        // shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2.0
    }
}
