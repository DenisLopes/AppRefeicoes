//
//  Refeicao.swift
//  cadastro-refeicao
//
//  Created by Denis Carlos Lopes da Silva on 26/01/21.
//

import UIKit

class Refeicao: NSObject {
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        for item in itens {
            total = total + item.calorias
        }
        return total
    }
    
    func detalhe() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        
        for item in itens{
            mensagem += ", \(item.nome) - caloreias: \(item.calorias)"
        }
        
        return mensagem
    }
    
}
