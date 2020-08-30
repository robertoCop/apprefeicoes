//
//  AdicionarItensViewController.swift
//  estudo1
//
//  Created by Roberto Banasewicz junior on 09/08/20.
//  Copyright © 2020 Roberto Banasewicz junior. All rights reserved.
//

import UIKit

protocol AdicionaItemDelegate{
     func adicionarUmItemALista(_ item : Item)
}
class AdicionarItensViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    var delegate : AdicionaItemDelegate?
    
    init(delegate : AdicionaItemDelegate){
           super.init(nibName: "AdicionarItensViewController", bundle: nil)
           self.delegate = delegate
    }
       
    required init?(coder: NSCoder) {
       super.init(coder: coder)
    }
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    @IBAction func AdicionarItem(_ sender: UIButton) {
        guard let nome = nomeTextField.text else { return }
        guard let caloriaValor = caloriasTextField.text else { return }
        
        if let caloria = Double(caloriaValor) {
            let item = Item(nome: nome, calorias: caloria)
            delegate?.adicionarUmItemALista(item)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
