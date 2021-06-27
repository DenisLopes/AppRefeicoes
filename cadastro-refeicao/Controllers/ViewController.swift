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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdiconaItensDelegate {
    
    //Mark: - IBoutlet
    
    @IBOutlet weak var itensTableView: UITableView!
    
    
    
    // MARK: - Atributos
    
    var delegate: RefeicaoTableViewController?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    // MARK: - IBoutlet
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextfield: UITextField?
    
    //MARK: - view life cycle
    
    override func viewDidLoad() {
        let botaoAdicionaitem = UIBarButtonItem(title: "Adicionar Itens", style: .plain, target: self, action: #selector(adiconarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaitem
        recuperaItens()
    }
    
    func recuperaItens() {
        itens = ItemDao().recupera()
    }
    
    @objc func adiconarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func adicionaItens(_ item: Item) {
        itens.append(item)
        ItemDao().save(itens)
        if let tableView = itensTableView{
            tableView.reloadData()
        }else{
            Alerta(controller: self).exibe(mensagem: "Desculpe nao foi possivel atualizar a sua tabela")
        }
        
    }
    
    //MARK: - UiTableDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let ingredientes = indexPath.row
        let item = itens[ingredientes]
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {
            return
        }
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        }else{
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item){
                itensSelecionados.remove(at: position)
            }
        }
        
    }
    
    func dadosDoFurmulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextfield?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        if let refeicao = dadosDoFurmulario() {
            delegate?.adicionaRefeicao(refeicao)
            navigationController?.popViewController(animated: true)
        }else{
            Alerta(controller: self).exibe(mensagem: "Erro ao preencher os campos")
        }
        
        
    }
    
    
}

