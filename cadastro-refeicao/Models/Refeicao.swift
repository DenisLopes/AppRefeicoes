//
//  Refeicao.swift
//  cadastro-refeicao
//
//  Created by Denis Carlos Lopes da Silva on 26/01/21.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    //MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    //MARK: - init
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    //MARK: - NSCoding
    
    func encode(with acoder: NSCoder) {
        acoder.encode(nome, forKey: "nome")
        acoder.encode(felicidade, forKey: "felicidade")
        acoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as? String ?? "indefinido"
        felicidade = coder.decodeInteger(forKey: "felicidade")
        itens = coder.decodeObject(forKey: "itens") as? Array ?? []
    }
    
    //MARK: - Metodos
    
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
