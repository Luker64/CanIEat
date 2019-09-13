//
//  ProductsViewController.swift
//  CanIEat
//
//  Created by Student on 13/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

var products = [Product]()

class ProductsViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        products = ProductDAO.getList()
    }

}

extension UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
        
        if let productCell = cell as? ProductsTableViewCell{
            
            let product = products[indexPath.row]
            
            
        }
        return cell
    }
}

extension UITableViewDelegate{
    
}
