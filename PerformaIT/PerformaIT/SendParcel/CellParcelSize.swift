//
//  CellParcelSize.swift
//  PerformaIT
//
//  Created by Julio Cezar de Souza on 20/05/21.
//

import UIKit

class CellParcelSize: UITableViewCell {
    
    
    @IBOutlet weak var imageParcel: UIImageView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var fitsLabel: UILabel!
    
    func configureCell(index:Int) {
        
        switch index {
        case 0:
            sizeLabel.text = "Small"
            maxLabel.text = "Max. 25kg, 8x38x64 cm"
            fitsLabel.text = "Fits in an envolope"
            imageParcel.image = UIImage(named: "Logo_PagSeguro.jpeg")
        case 1:
            sizeLabel.text = "Medium"
            maxLabel.text = "Max. 25kg, 19x38x64 cm"
            fitsLabel.text = "Fits in a shoe box"
        case 2:
            sizeLabel.text = "Large"
            maxLabel.text = "Max. 25kg, 48x38x64 cm"
            fitsLabel.text = "Fits in a cardboard box"
        case 3:
            sizeLabel.text = "Custom"
            maxLabel.text = "Max. 30kg or 300cm"
            fitsLabel.text = "Fits in a skid"
        default:
            sizeLabel.text = "teste"
        }
        
    }
}
