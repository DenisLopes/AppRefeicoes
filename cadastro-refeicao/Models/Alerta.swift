//
//  Alerta.swift
//  cadastro-refeicao
//
//  Created by Denis Carlos Lopes da Silva on 26/06/21.
//

import UIKit

class Alerta {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Desculpe", mensagem: String){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let botaoOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(botaoOk)
        controller.present(alerta, animated: true, completion: nil)
    }
    
}
