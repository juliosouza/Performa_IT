//
//  ViewController.swift
//  PerformaIT
//
//  Created by Julio Cezar de Souza on 17/05/21.
//

import UIKit

class MyParcelsViewController: UIViewController {

    @IBOutlet weak var trackParcelView: UIView!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func findParcel(_ sender: Any) {
        
        UIView.animate(withDuration: 2.0, delay: 1.0, options: [.curveEaseOut], animations: {
//            self.trackParcelView.frame = CGRect(x: self.trackParcelView.frame.origin.x, y: self.trackParcelView.frame.origin.y, width: self.trackParcelView.frame.size.width, height: 380.0)
            self.viewHeightConstraint.constant = 0
        }, completion: nil)
    
    }
}

