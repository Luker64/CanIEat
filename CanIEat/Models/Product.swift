//
//  Product.swift
//  CanIEat
//
//  Created by Student on 12/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Product {
    let name : String
    let ingredients : String
    let portion : String
    let energeticValue : Double
    let carbohidrates : Double
    let proteins : Double
    let totalFat : Double
    let fiber : Double
    let sodium : Double
    let brand : String
    let restrictions : [Restriction]
    let imageName : String
    
    init(name : String, ingredients : String, portion : String, energeticValue : Double, carbohidrates : Double, proteins : Double, totalFat : Double, fiber : Double, sodium : Double, brand: String, restrictions : [Restriction], imageName : String) {
        self.name = name
        self.ingredients = ingredients
        self.portion = portion
        self.energeticValue = energeticValue
        self.carbohidrates = carbohidrates
        self.proteins = proteins
        self.totalFat = totalFat
        self.fiber = fiber
        self.sodium = sodium
        self.brand = brand
        self.restrictions = restrictions
        self.imageName = imageName
    }
}

class ProductDAO {
    func getList() -> [Product]{
        return [
            Product(name: "Feijāo Cores", ingredients: "Feijāo", portion: "60g", energeticValue: 207, carbohidrates: 37, proteins: 13, totalFat: 0.9, fiber: 9.1, sodium: 0.009, brand: "Feijao Sao Joao", restrictions: [], imageName: ""),
            Product(name: "Molho de Tomate", ingredients: "Tomate, açúcar, cebola, amido modificado, sal, extrato de levedura, salsa, manjericão, orégano, tomilho, conservador sorbato de potássio, realçador de sabor glutamato monossódico e aromatizantes. CONTÉM GLÚTEN. ALÉRGICOS: CONTÉM DERIVADOS DE CEVADA. PODE CONTER DERIVADOS DE LEITE DE VACA, SOJA E TRIGO.", portion: "60g", energeticValue: 27, carbohidrates: 5.8, proteins: 0.5, totalFat: 0, fiber: 0.6, sodium: 0.316, brand: "Quero", restrictions: [Restriction(name: "Lactose"), Restriction(name: "Soja"), Restriction(name: "Trigo")], imageName: ""),
            Product(name: "Leite", ingredients: "Leite integral e estabilizantes trifosfato de sódio, citrato de sódio, monofosfato de sódio e difosfato de sódio.", portion: "200ml", energeticValue: 115, carbohidrates: 9.1, proteins: 6.1, totalFat: 6, fiber: 0, sodium: 0.122, brand: "Mimosa", restrictions: [Restriction(name: "Lactose")], imageName: "")
        ]
    }
}

class Restriction{
    let name : String
    
    init(name: String) {
        self.name = name
    }
}
