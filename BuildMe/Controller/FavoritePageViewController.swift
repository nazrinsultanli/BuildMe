//
//  FavoritePageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class FavoritePageViewController: UIViewController {
    
    var viewModel =  FavoritePageViewModel()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpTableView()
        
        
        tableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.refreshData()
        tableView.reloadData()
    }
    
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "FavoriteTableCell", bundle: nil), forCellReuseIdentifier: "FavoriteTableCell")
        tableView.isEditing = true
        
    }
    
    func addToBasket(for index: Int) {
        guard index < viewModel.productData.count else { return }
        
        let updatedProduct = viewModel.productData[index]
        updatedProduct.basketed = true
        viewModel.productData[index] = updatedProduct
      
        ParserforFav.shared.writeData(to: "productLocal.json", data: viewModel.productData)
        
        tableView.reloadData()
    }
    
    func showAlert(title: String){
        let alertController = UIAlertController (title: "Product \(title) is added", message: "", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
    
}


extension FavoritePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.productData.filter({ $0.favorited == true }).count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableCell", for: indexPath) as! FavoriteTableCell
       
        cell.basketButtonClicked = {index, title in
            self.showAlert(title: self.viewModel.productData.filter({ $0.favorited == true })[indexPath.row].modelName)
            self.addToBasket(for: index)
        }
        
        
        
        cell.setFavTable(product: viewModel.productData.filter({ $0.favorited == true })[indexPath.row])
        
        return cell
    }
    


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the product from the data source
            var productToDelete = viewModel.productData.filter { $0.favorited == true }[indexPath.row]
            
            productToDelete.favorited = false
   
            tableView.deleteRows(at: [indexPath], with: .fade)

            ParserforFav.shared.writeData(to: "productLocal.json", data: viewModel.productData)
        }
    }


    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
}

