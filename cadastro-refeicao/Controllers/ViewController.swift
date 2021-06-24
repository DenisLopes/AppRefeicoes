//
//  ViewController.swift
//  cadastro-refeicao
//
//  Created by Denis Carlos Lopes da Silva on 25/01/21.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func adicionaRefeicao(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - Atributos
    
    var delegate: RefeicaoTableViewController?
    var itens: [String] = ["","","",""]
    
    // MARK: - IBoutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextfield: UITextField?
    
    //MARK: - UiTableDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = "teste"
        
        return celula
    }
    
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextfield?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("comi \(refeicao.nome) fiquei com felicidade \(refeicao.felicidade)")
        
        delegate?.adicionaRefeicao(refeicao)
        
        navigationController?.popViewController(animated: true)
        
    }
    

}

