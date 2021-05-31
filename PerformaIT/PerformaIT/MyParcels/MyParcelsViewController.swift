//
//  ViewController.swift
//  PerformaIT
//
//  Created by Julio Cezar de Souza on 17/05/21.
//

import UIKit
import CoreData

class MyParcelsViewController: UIViewController {

    @IBOutlet weak var trackParcelView: UIView!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberParcelTextField: UITextField!
    @IBOutlet weak var tableParcels: UITableView!
    @IBOutlet weak var trackParcelButton: UIButton!
    @IBOutlet weak var qrCodeImage: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    var gerenciadorDeResultados:NSFetchedResultsController<Encomenda>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackParcelView.frame.size.height = 0
        self.tableParcels.delegate = self
        self.tableParcels.dataSource = self
        self.recuperaEncomenda()
        setupLayout()
    }
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func setupLayout() {
        self.trackParcelView.layer.cornerRadius = 5
        self.trackParcelButton.layer.cornerRadius = 5
        self.qrCodeImage.layer.cornerRadius = 5
        self.avatarImage.layer.cornerRadius = avatarImage.frame.height/2
    }
    
    @IBAction func findParcel(_ sender: Any) {
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseOut], animations: {
            self.trackParcelView.frame = CGRect(x: self.trackParcelView.frame.origin.x, y: self.trackParcelView.frame.origin.y, width: self.trackParcelView.frame.size.width, height: 380.0)
//            self.viewHeightConstraint.constant = 0
        }, completion: nil)
    
    }
    
    
    @IBAction func trackParcel(_ sender: Any) {
        guard let numParcel = numberParcelTextField.text else { return }
        
        recuperaEncomenda(query: numParcel)
    }
    
    func recuperaEncomenda(query:String = "") {
        let pesquisaEncomenda:NSFetchRequest<Encomenda> = Encomenda.fetchRequest()
        pesquisaEncomenda.predicate = NSPredicate(format: "numencomenda CONTAINS %@", query)
        
        
        let ordenaPorStatus = NSSortDescriptor(key: "status", ascending: true)
        pesquisaEncomenda.sortDescriptors = [ordenaPorStatus]
        
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: pesquisaEncomenda, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try gerenciadorDeResultados?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        tableParcels.reloadData()
    }
}

extension MyParcelsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let contEncomendas = gerenciadorDeResultados?.fetchedObjects?.count else { return 0 }
        
        return contEncomendas
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellParcel", for: indexPath) as! CellEncomenda
        
        guard let encomenda = gerenciadorDeResultados?.fetchedObjects![indexPath.row] else { return cell }
        
        cell.configure(encomenda)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 198
    }
}
