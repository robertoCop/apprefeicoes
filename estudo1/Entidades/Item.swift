//
//  Item.swift
//  estudo1
//
//  Created by Roberto Banasewicz junior on 11/07/20.
//  Copyright © 2020 Roberto Banasewicz junior. All rights reserved.
//

import UIKit

class Item: NSObject {
    var nome : String
    var calorias : Double
    
    init(nome : String, calorias : Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
