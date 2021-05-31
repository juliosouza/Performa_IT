//
//  CellEncomenda.swift
//  PerformaIT
//

import UIKit

class CellEncomenda: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    @IBOutlet weak var numEncomendaLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var progressStatusParcel: UIProgressView!
    @IBOutlet weak var viewCell: UIView!
    
    var encomendas: [Encomenda] = []
    
    func configure(_ encomenda: Encomenda) {
        
        numEncomendaLabel.text = encomenda.numencomenda
        lastUpdateLabel.text = "Ultima atualização: 3 horas agora"
        viewCell.addShadow()
        
        switch encomenda.status {
        case 1:
            statusLabel.text = "Registrado"
            progressStatusParcel.progress = 0.1
        case 2:
            statusLabel.text = "Deixou o Centro de Distribuição"
            progressStatusParcel.progress = 0.4
        case 3:
            statusLabel.text = "Em Trânsito"
            progressStatusParcel.progress = 0.7
        case 4:
            statusLabel.text = "Entregue"
            progressStatusParcel.progress = 1.0
        default:
            progressStatusParcel.progress = 0.0
        }
        
    }
}
