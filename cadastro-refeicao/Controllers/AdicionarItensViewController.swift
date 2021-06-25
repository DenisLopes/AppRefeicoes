//
//  AdicionarItensViewController.swift
//  cadastro-refeicao
//
//  Created by Denis Carlos Lopes da Silva on 24/06/21.
//

import UIKit

protocol AdiconaItensDelegate {
    func adicionaItens(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextfield: UITextField!
    @IBOutlet weak var caloriasTextfield: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdiconaItensDelegate?
    
    init(delegate: AdiconaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction

    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextfield.text, let calorias = caloriasTextfield.text else{
            return
        }
        
        guard let numeroCalorias = Double(calorias) else{
            return
        }
        
        let item = Item(nome: nome, calorias: numeroCalorias)
        delegate?.adicionaItens(item)
        navigationController?.popViewController(animated: true)
    }
}
