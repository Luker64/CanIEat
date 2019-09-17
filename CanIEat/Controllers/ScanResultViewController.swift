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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prodImage.image = UIImage(named: prod?.imageName ?? "")
        prodName.text = prod?.name
        prodBrand.text = prod?.brand
        prodEnergeticV.text = String(format:"%f", prod?.energeticValue ?? "")
        prodCarbo.text = String(format:"%f", prod?.carbohidrates ?? "")
        prodProteins.text = String(format:"%f", prod?.proteins ?? "")
        prodIngredients.text = prod?.ingredients
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            let anterior = delegate as! ScanViewController
            anterior.changeScanned()
        }
    }

}
