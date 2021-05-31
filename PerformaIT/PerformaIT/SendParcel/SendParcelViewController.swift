//
//  SendParcelViewController.swift
//  PerformaIT
//
//  Created by Julio Cezar de Souza on 17/05/21.
//

import UIKit

class SendParcelViewController: UIViewController {
    
    
    @IBOutlet weak var viewSmall: UIView!
    @IBOutlet weak var viewMedium: UIView!
    @IBOutlet weak var viewLarge: UIView!
    @IBOutlet weak var viewCustom: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @IBAction func parcelSmall(_ sender: Any) {
        let package = Package(size: .small, description: "max alguma coisa", sizeDescription: "cabe envelope")
        self.performSegue(withIdentifier: "cadSegue", sender: package)
    }
    
    @IBAction func parcelMedium(_ sender: Any) {
        let package = Package(size: .medium, description: "max alguma coisa", sizeDescription: "cabe envelope")
        self.performSegue(withIdentifier: "cadSegue", sender: package)
    }
    
    @IBAction func parcelLarge(_ sender: Any) {
        print("teste large button")
    }
    

    @IBAction func parcelCustom(_ sender: Any) {
        print("teste custom button")
    }
    
    func setupViews() {
        viewSmall.addShadow()
        viewMedium.addShadow()
        viewLarge.addShadow()
        viewCustom.addShadow()
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cadSegue" {
            if let selectedPackage = sender as? Package {
                let cadViewController = segue.destination as! CadSendParcelViewController
                cadViewController.package = selectedPackage
            }
        }
    }
}
