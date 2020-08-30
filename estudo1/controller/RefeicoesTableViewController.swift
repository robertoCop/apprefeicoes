//
//  TableViewController.swift
//  estudo1
//
//  Created by Roberto Banasewicz junior on 23/07/20.
//  Copyright © 2020 Roberto Banasewicz junior. All rights reserved.
//

import UIKit

class RefeicoesTableViewController : UITableViewController, AdicionaRefeicaoDelegate{//possui o protoco, interface que sera acessada por outra controller
    
    var refeicoes : Array<Refeicao> = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count//metodo exibe a quantidade de linhas a ser criada conforme a lista preenchida
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier:nil)//exibir na tela a lista dos objetos
        let refeicao = refeicoes[indexPath.row]
        cell.textLabel?.text = refeicao.comida + " " + notarefeicao(refeicao.felicidade)
        return cell
    }

    
    func notarefeicao(_ nota : Int) -> String {
        var emoji :String = ""
        if(nota == 1){
            emoji = "😖"
        }
        if(nota == 2){
            emoji = "🤨"
        }
        if(nota == 3){
            emoji = "☺️"
        }
        if(nota == 4){
            emoji = "😃"
        }
        if(nota == 5){
            emoji = "😋"
        }else{
            emoji = ""
        }
        return emoji
    }
    
    func addRefeicaolista(_ refeicao : Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//prepara antes de ir para outra tela
        
        if segue.identifier == "adicionar"{//nome da tela 'identificador'
            if let viewController = segue.destination as? ViewController{//casting para a viewcontroller evitando de pegar o tipo generico
                viewController.delegate = self
            }
        }
    }
    
}
