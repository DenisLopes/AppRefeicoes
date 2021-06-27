//
//  ItemDao.swift
//  cadastro-refeicao
//
//  Created by Denis Carlos Lopes da Silva on 27/06/21.
//

import Foundation

class ItemDao{
    
    func save(_ itens: [Item]){
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else {
                return
            }
            try dados.write(to: caminho)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
    
    func recupera() -> [Item]{
        guard let caminho = recuperaDiretorio() else {
            return []
        }
        do{
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Item> else {
                return []
            }
            return itensSalvas
            
        }catch{
            print(error.localizedDescription)
            return []
        }
        
    }
    
}

