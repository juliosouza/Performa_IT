//
//  CadSendParcelViewController.swift
//  PerformaIT
//
//  Created by Julio Cezar de Souza on 25/05/21.
//

import UIKit
import CoreData

protocol CadSendParcelDelegate {
    
}

class CadSendParcelViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var finalizarButton: UIButton!
    @IBOutlet weak var viewFinalizarButton: UIView!
    @IBOutlet weak var viewFromDoor: UIView!
    @IBOutlet weak var viewDoorToDoor: UIView!
    
    var package: Package?
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewFinalizarButton.layer.cornerRadius = 5
        setupViews()
    }
    
    func setupViews() {
        viewFromDoor.addShadow()
        viewDoorToDoor.addShadow()
    }
    
    @IBAction func finalizarButton(_ sender: Any) {
        let encomenda = Encomenda(context: contexto)
        encomenda.numencomenda = "0000074123"
        encomenda.status = Int32(Int.random(in: 1...4))
        encomenda.nome = nameTextField.text
        encomenda.email = emailTextField.text
        encomenda.telefone = telefoneTextField.text
        encomenda.endereco = enderecoTextField.text
        
        do {
            try contexto.save()
            showAlert(message: "Cadastro realizado com sucesso!")
        } catch {
            showAlert(message: "Erro ao cadastrar encomenda!")
        }
    }

    
    func showAlert(message: String) {
        let alerta = UIAlertController(title: message, message: "", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: { reset in
            self.nameTextField.text = ""
            self.emailTextField.text = ""
            self.telefoneTextField.text = ""
            self.enderecoTextField.text = ""
        })
        alerta.addAction(okButton)
        present(alerta, animated: true, completion: nil)
    }
}
