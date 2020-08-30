//
//  ViewController.swift
//  estudo1
//
//  Created by Roberto Banasewicz junior on 04/07/20.
//  Copyright © 2020 Roberto Banasewicz junior. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {//semelhante a interface, inclui somente o que deve ser acessado entre controllers
    func addRefeicaolista(_ refeicao : Refeicao)//metodo de outra controller RefeicoesTableViewController
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItemDelegate{
    
    var delegate : AdicionaRefeicaoDelegate?
    var itens : Array<Item> = []
    var itensSelecionados : Array<Item> = []
    @IBOutlet weak var comidaTextField: UITextField?
    @IBOutlet var felicidadeTextField : UITextField?
    @IBOutlet weak var itensTableView: UITableView!
    
    override func viewDidLoad() {
        let botaoAdicionarItem = UIBarButtonItem(title: "Adicionar temperos", style: .plain, target: self, action: #selector(self.adicionarItem))// com # podemos chamar o metodo de uma forma mais segura, evitando um crash no app
        navigationItem.rightBarButtonItem = botaoAdicionarItem
    }
    
    @objc func adicionarItem(){//usamos @objc para informar que metodo tbm pode ser usado em Object C, evitando crash
        let adicionarItensViewController = AdicionarItensViewController(delegate : self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func adicionarUmItemALista(_ item : Item){
        itens.append(item)
        itensTableView.reloadData()
    }
    
    @IBAction func adicionar(_ sender: UIButton) {
        
        if let nomeComida = comidaTextField?.text , let felicidadeValor = felicidadeTextField?.text{
            let comida = nomeComida
            if let felicidade = Int(felicidadeValor){
                let refeicao = Refeicao(comida: comida, felicidade: felicidade, itens: itensSelecionados)
                print("Sua refeicao é \(refeicao.comida) e possui \(refeicao.felicidade) de felicidade")
                
                delegate?.addRefeicaolista(refeicao)
                navigationController?.popViewController(animated: true)
            }else{
                print("Erro ao gerar felicidade")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linha = indexPath.row
        let item = itens[linha]
        cell.textLabel?.text = item.nome
        return cell
    }
    
    // MARK: uitableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            itensSelecionados.append(itens[indexPath.row])
            print("Item adicionado")
        }else{
            celula.accessoryType = .none
            for i in 0...itensSelecionados.count-1{
                let itemDesmarcado = itens[indexPath.row]
                
                if itemDesmarcado.nome == itensSelecionados[i].nome {
                    itensSelecionados.remove(at: i)
                    print("Item removido")
                }
            }
        }
    }
    
}

