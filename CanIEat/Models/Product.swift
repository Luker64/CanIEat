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
    let barCode : String
    
    init(name : String, ingredients : String, portion : String, energeticValue : Double, carbohidrates : Double, proteins : Double, totalFat : Double, fiber : Double, sodium : Double, brand: String, restrictions : [Restriction], imageName : String, barCode: String) {
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
        self.barCode = barCode
    }
}

class ProductDAO {
    static func getList() -> [Product]{
        return [
            Product(name: "Feijāo Cores", ingredients: "Feijāo", portion: "60g", energeticValue: 207, carbohidrates: 37, proteins: 13, totalFat: 0.9, fiber: 9.1, sodium: 0.009, brand: "Camil", restrictions: [], imageName: "feijao", barCode: ""),
            Product(name: "Molho de Tomate", ingredients: "Tomate, açúcar, cebola, amido modificado, sal, extrato de levedura, salsa, manjericão, orégano, tomilho, conservador sorbato de potássio, realçador de sabor glutamato monossódico e aromatizantes. CONTÉM GLÚTEN. ALÉRGICOS: CONTÉM DERIVADOS DE CEVADA. PODE CONTER DERIVADOS DE LEITE DE VACA, SOJA E TRIGO.", portion: "60g", energeticValue: 27, carbohidrates: 5.8, proteins: 0.5, totalFat: 0, fiber: 0.6, sodium: 0.316, brand: "Quero", restrictions: [Restriction(name: "Lactose"), Restriction(name: "Soja"), Restriction(name: "Trigo")], imageName: "molho", barCode: ""),
            Product(name: "Leite", ingredients: "Leite integral e estabilizantes trifosfato de sódio, citrato de sódio, monofosfato de sódio e difosfato de sódio.", portion: "200ml", energeticValue: 115, carbohidrates: 9.1, proteins: 6.1, totalFat: 6, fiber: 0, sodium: 0.122, brand: "Piracanjuba", restrictions: [Restriction(name: "Lactose")], imageName: "leite", barCode: "7894000050034"),
            Product(name: "Leite zero lactose", ingredients: "Leite desnatado, enzima lactase e estabilizantes trifosfato de sódio, citrato de sódio, monofosfato de sódio e disfosfato de sódio.", portion: "200ml", energeticValue: 31, carbohidrates: 4.6, proteins: 3.1, totalFat: 6.0, fiber: 0, sodium:0.062, brand: "Piracanjuba", restrictions: [], imageName: "zero_lactose", barCode: ""),
            Product(name: "Biscoito Trakinas Chocolate", ingredients: "Farinha de trigo enriquecida com ferro e ácido fólico, açúcar, gordura vegetal hidrogenada, açúcar invertido, cacal, sal, corange caramelo III, fermentos químicos: Bicarbonato de sódio, fosfato monocálcio e bicarbonato de amônio, aromatizantes, emulsificantes: Lecitina de soja e ésteres de ácido diacetil tartárico e mono e diglicerídeos, corante natural carmim e acidulante ácido cítrico. Contém trigo e soja", portion: "30g (3 unidades)", energeticValue: 144, carbohidrates: 21, proteins: 1.7, totalFat: 5.8, fiber: 0, sodium: 0.078, brand: "Bauducco", restrictions: [Restriction(name: "Soja"), Restriction(name: "Trigo")], imageName: "trakinas", barCode: ""),
            Product(name: "Arroz", ingredients: "Arroz", portion: "50g", energeticValue: 171, carbohidrates: 39, proteins: 3.7, totalFat: 0, fiber: 0.8, sodium: 0, brand: "Camil", restrictions: [], imageName: "arroz", barCode: ""),
            Product(name: "Café Extra Forte", ingredients: "Café", portion: "500g", energeticValue: 0, carbohidrates: 0, proteins: 0, totalFat: 0, fiber: 0, sodium: 0, brand: "Melita", restrictions: [Restriction(name: "Cafeína")], imageName: "cafemelitaef", barCode: "7891021006934")
        ]
    }
    
    static func find(_ barcode: String) -> Product{
        var prods = ProductDAO.getList()
        for prod in prods {
            if(prod.barCode == barcode){
                return prod
            }
        }
        return Product(name: "NotFound", ingredients: "", portion: "a", energeticValue: 0, carbohidrates: 0, proteins: 0, totalFat: 0, fiber: 0, sodium: 0, brand: "", restrictions: [Restriction(name: "NULL")], imageName: "", barCode: barcode)
    }
    
    static func findId(_ id: Int) -> Product{
        var prods = ProductDAO.getList()
        return prods[id]
    }
}

class Restriction{
    let name : String
    
    init(name: String) {
        self.name = name
    }
}
