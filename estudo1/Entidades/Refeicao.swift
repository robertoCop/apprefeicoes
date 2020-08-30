//
//  Refeicao.swift
//  estudo1
//
//  Created by Roberto Banasewicz junior on 11/07/20.
//  Copyright © 2020 Roberto Banasewicz junior. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
       var comida : String
       var felicidade : Int
       var itens : Array<Item> = []
       
    init(comida: String, felicidade : Int, itens : Array<Item> = []) {//inicializando itens vazio
           self.comida = comida
           self.felicidade = felicidade
           self.itens = itens
    }
    
       func totalCalorias() -> Double {
           var totalCalorias = 0.0
           
           for iten in itens{
               totalCalorias += iten.calorias
           }
           
           return totalCalorias
       }
}
