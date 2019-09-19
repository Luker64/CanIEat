//
//  ProductInfoViewController.swift
//  CanIEat
//
//  Created by Student on 12/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ProductInfoViewController: UIViewController {

    var prod : Product?
    
    @IBOutlet weak var prodImage: UIImageView!
    @IBOutlet weak var prodName: UILabel!
    @IBOutlet weak var prodBrand: UILabel!
    @IBOutlet weak var prodPortion: UILabel!
    @IBOutlet weak var prodEnergeticV: UILabel!
    @IBOutlet weak var prodCarbo: UILabel!
    @IBOutlet weak var prodProteins: UILabel!
    @IBOutlet weak var prodTotalFats: UILabel!
    @IBOutlet weak var prodFiber: UILabel!
    @IBOutlet weak var prodSodium: UILabel!
    @IBOutlet weak var prodIngredients: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prodName.text = prod?.name
        prodImage.image = UIImage(named: prod?.imageName ?? "")
        prodBrand.text = "Marca: \(prod?.brand ?? "")"
        prodPortion.text = "Porçāo: \(prod?.portion ?? "")"
        prodEnergeticV.text = "Valor Energetico (kcal): \(String(format:"%.2f", prod?.energeticValue ?? ""))"
        prodCarbo.text = "Carboidratos (g): \(String(format:"%.2f", prod?.carbohidrates ?? ""))"
        prodProteins.text = "Proteinas (g): \(String(format:"%.2f", prod?.proteins ?? ""))"
        prodTotalFats.text = "Gorduras Totais (g): \(String(format:"%.2f", prod?.totalFat ?? ""))"
        prodFiber.text = "Fibras (g): \(String(format:"%.2f", prod?.fiber ?? ""))"
        prodSodium.text = "Sódio (g): \(String(format:"%.2f", prod?.sodium ?? ""))"
        prodIngredients.text = "Ingredientes: \(prod?.ingredients ?? "")"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
