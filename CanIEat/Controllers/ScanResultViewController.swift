//
//  ScanResultViewController.swift
//  CanIEat
//
//  Created by Student on 12/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ScanResultViewController: UIViewController {

    
    var prod : Product?
    var delegate : ScanViewController?
    
    @IBOutlet weak var prodImage: UIImageView!
    @IBOutlet weak var prodName: UILabel!
    @IBOutlet weak var prodBrand: UILabel!
    @IBOutlet weak var prodEnergeticV: UILabel!
    @IBOutlet weak var prodCarbo: UILabel!
    @IBOutlet weak var prodProteins: UILabel!
    @IBOutlet weak var prodIngredients: UILabel!
    @IBOutlet weak var compatibility: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prodImage.image = UIImage(named: prod?.imageName ?? "")
        prodName.text = prod?.name
        prodBrand.text = "Marca: \(prod?.brand ?? "")"
        prodEnergeticV.text = "Valor Energetico: \(String(format:"%.2f", prod?.energeticValue ?? ""))"
        prodCarbo.text = "Carbohidratos: \(String(format:"%.2f", prod?.carbohidrates ?? ""))"
        prodProteins.text = "Proteinas: \(String(format:"%.2f", prod?.proteins ?? ""))"
        prodIngredients.text = "Ingredientes: \(prod?.ingredients ?? "")"
        
        var canEat = true
        var user = UserDAO.getUser()
        for rest in user.restrictions{
            for prodrest in prod?.restrictions ?? []{
                if rest.name == prodrest.name{
                    canEat = false
                    break
                }
            }
        }
        
        if canEat {
            compatibility.backgroundColor = UIColor(named: "green")
            compatibility.text = "Está compatível"
        }else{
            compatibility.text = "Nāo está compatível"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            let anterior = delegate as! ScanViewController
            anterior.changeScanned()
        }
    }

}
