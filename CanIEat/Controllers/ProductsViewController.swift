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
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        products = ProductDAO.getList()
        
    }

}

extension ProductsViewController: UITableViewDataSource{
    
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
            
            productCell.productImage.image = UIImage(named: product.imageName)
            productCell.productNamelbl.text = product.name
            productCell.brandlbl.text = product.brand
            productCell.portionlbl.text = product.portion
            
        }
        return cell
    }
}

extension ProductsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
