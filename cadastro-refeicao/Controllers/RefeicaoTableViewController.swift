//
//  RefeicaoTableViewController.swift
//  cadastro-refeicao
//
//  Created by Denis Carlos Lopes da Silva on 23/06/21.
//

import UIKit

class RefeicaoTableViewController: UITableViewController, AdicionaRefeicaoDelegate{
    
    var refeicoes = [Refeicao(nome: "Pizza", felicidade: 10),
                     Refeicao(nome: "Comida japonesa", felicidade: 8),
                     Refeicao(nome: "Churrasco", felicidade: 9)]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
    
    func adicionaRefeicao(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewCntroller = segue.destination as? ViewController{
            viewCntroller.delegate = self
        }
    }
    
}
