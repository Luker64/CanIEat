//
//  ScanTestViewController.swift
//  CanIEat
//
//  Created by Student on 17/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ScanTestViewController: UIViewController {
    
    var res: String = ""
    var delegate : ScanViewController?

    @IBOutlet weak var resLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resLabel.text = res
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            let anterior = delegate as! ScanViewController
            anterior.changeScanned()
        }
    }
}
