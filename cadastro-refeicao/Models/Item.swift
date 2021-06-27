//
//  Item.swift
//  cadastro-refeicao
//
//  Created by Denis Carlos Lopes da Silva on 26/01/21.
//

import UIKit

class Item: NSObject {
    
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
}
