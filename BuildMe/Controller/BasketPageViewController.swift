//
//  BasketPageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class BasketPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        
        tableView.register(UINib(nibName: "BasketTableCell", bundle: nil), forCellReuseIdentifier: "BasketTableCell")

        tableView.isEditing = true
        
        tableView.reloadData()

        
       
    }
    


}



extension BasketPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableCell", for: indexPath) as! BasketTableCell


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
