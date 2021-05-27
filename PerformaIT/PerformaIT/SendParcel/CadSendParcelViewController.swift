//
//  CadSendParcelViewController.swift
//  PerformaIT
//
//  Created by Julio Cezar de Souza on 25/05/21.
//

import UIKit
import CoreData

class CadSendParcelViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finalizarButton(_ sender: Any) {
        let encomenda = Encomenda(context: contexto)
        encomenda.nome = nameTextField.text
        encomenda.email = emailTextField.text
        encomenda.telefone = telefoneTextField.text
        encomenda.endereco = enderecoTextField.text
        
        do {
            try contexto.save()
            print("sucesso")
        } catch {
            print("erro")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
