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
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func adicionaRefeicao(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else {
                return
            }
            let refeicao = refeicoes[indexPath.row]
            
            let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhe(), preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alerta.addAction(botaoCancelar)
            present(alerta, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewCntroller = segue.destination as? ViewController{
            viewCntroller.delegate = self
        }
    }
    
}
