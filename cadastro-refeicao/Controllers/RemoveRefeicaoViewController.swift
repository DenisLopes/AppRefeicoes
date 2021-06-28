//
//  RemoveRefeicaoViewController.swift
//  cadastro-refeicao
//
//  Created by Denis Carlos Lopes da Silva on 26/06/21.
//

import UIKit

class RemoveRefeicaoViewController{
    let controllet: UIViewController
    
    init(controller: UIViewController) {
        self.controllet = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhe(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        alerta.addAction(botaoRemover)
        
        controllet.present(alerta, animated: true, completion: nil)
    }
}
