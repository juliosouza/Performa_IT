//
//  SendParcelViewController.swift
//  PerformaIT
//
//  Created by Julio Cezar de Souza on 17/05/21.
//

import UIKit

class SendParcelViewController: UIViewController {

    @IBOutlet weak var tableParcelSize: UITableView!
    
    var valor:Array<String> = ["valor 1", "valor 2", "valor 3", "valor 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableParcelSize.dataSource = self
        self.tableParcelSize.delegate = self
    }

    
}

extension SendParcelViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellParcelSize") as! CellParcelSize
//        cell.configureCell(index: indexPath.row)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
