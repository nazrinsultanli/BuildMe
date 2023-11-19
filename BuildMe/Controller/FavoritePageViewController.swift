//
//  FavoritePageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class FavoritePageViewController: UIViewController {

    var products = ProductJsGenerator().productData
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpTableView()

    }
    
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self

        
        tableView.register(UINib(nibName: "FavoriteTableCell", bundle: nil), forCellReuseIdentifier: "FavoriteTableCell")

        tableView.isEditing = true
        
        tableView.reloadData()
    }

}


extension FavoritePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.filter({ $0.favorited == true }).count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableCell", for: indexPath) as! FavoriteTableCell
        cell.setFavTable(product: products.filter({ $0.favorited == true })[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Perform the delete action (remove item from your data source)
            //yourDataSourceArray.remove(at: indexPath.row)

            // Update the table view to reflect the changes
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


}
