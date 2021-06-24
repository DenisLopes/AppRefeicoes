import UIKit

//let nome = "churrasco"
//let felicidade = 5
//let calorias = 78.5
//let vegetal = true
//
//func alimentoConsumido(){
//    print("Alimento consulmido foi \(nome)")
//}
//
//alimentoConsumido()
//
//
//func alimentosConsumido(_ nome: String, _ calorias: Double){
//    print("Alimento consulmido foi \(nome) com colorias \(calorias)")
//}
//
//alimentosConsumido(nome, calorias)


//let caloria1 = 50.5
//let caloria2 = 100
//let caloria3 = 300
//let caloria4 = 500
//
//
//let totalDeCalorias = [50.5, 100, 300, 500, 700]
//
//
//for calorias in totalDeCalorias{
//    print(calorias)
//}

//let totalDeCalorias = [0]
//
//func todasCalorias(totalDeCalorias: Array<Double>) -> Double{
//    var total = 0.0
//    for caloria in totalDeCalorias {
//        total = total + caloria
//    }
//
//    return total
//}
//
//let total = todasCalorias(totalDeCalorias: [50, 100, 200, 200, 100])
//
//print(total)


class Refeicao{
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    

    init(nome: String, felicidade: String) {
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
    
}


class Item{
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}


let arroz = Item(nome: "arroz", calorias: 100)
let feijao = Item(nome: "feijao", calorias: 230)
let carne = Item(nome: "carne", calorias: 720)

let refeicao = Refeicao(nome: "Almoço", felicidade: "5")
refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(carne)

print(refeicao.nome)

if let primeiroItemDaLista = refeicao.itens.first {
    print(primeiroItemDaLista.nome)
}

print(refeicao.totalDeCalorias())




//let refeicao = Refeicao(nome: "macarrao", felicidade: "5")
//
//print(refeicao.nome)
//print(refeicao.felicidade)
//
//
//let refeicao2 = Refeicao(nome: "churrasco", felicidade: "4")
//
//print(refeicao2.nome)
//print(refeicao2.felicidade)


//let refeicao = Refeicao()
//
//refeicao.nome = "macarao"
//
//if refeicao.nome != nil{
//    print(refeicao.nome!)
//}
//
//if let nome = refeicao.nome{
//    print(nome)
//}
//
//func exibeNomeDaRefeicao(){
//    if let nome = refeicao.nome{
//        print(nome)
//    }
//
//    guard let nome = refeicao.nome else {
//        return
//    }
//
//    print(nome)
//
//}
//
//exibeNomeDaRefeicao()
//
//let numero = Int ("5")
//
//if let n = numero{
//    print(n)
//}else{
//    print("erro ao converter string para int")
//}

//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextfield?.text{
//            let nome = nomeDaRefeicao
//            if let felicidade = Int(felicidadeDaRefeicao){
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//                print("comi \(refeicao.nome) fiquei com felicidade \(refeicao.felicidade)")
//            }else{
//                print("Erro ao Tentar criar refeicao")
//            }
//        }
