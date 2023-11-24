//
//  FavoritePageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class FavoritePageViewController: UIViewController {
    
    @IBOutlet weak var noFavoriteLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var viewModel =  FavoritePageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        hideNoFavoriteLabel()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.refreshData()
        tableView.reloadData()
        hideNoFavoriteLabel()
    }
    
    func hideNoFavoriteLabel() {
        if !viewModel.productData.filter({ $0.favorited == true }).isEmpty {
            noFavoriteLabel.isHidden = true
        }else{
            noFavoriteLabel.isHidden = false
        }
    }
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "FavoriteTableCell", bundle: nil), forCellReuseIdentifier: "FavoriteTableCell")
        tableView.isEditing = true
        
    }
    
    func addToBasket(for id: Int) {
        let updatedProduct = viewModel.productData.filter({ $0.idProduct == id }).first
        updatedProduct?.basketed = true
        updatedProduct?.order =  (updatedProduct?.order ?? 0) + 1
    
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
            print("index: \(index)")
            self.showAlert(title: self.viewModel.productData.filter({ $0.favorited == true })[indexPath.row].modelName)
            self.addToBasket(for: self.viewModel.productData.filter({ $0.favorited == true })[indexPath.row].idProduct)
        }
        cell.setFavTable(product: viewModel.productData.filter({ $0.favorited == true })[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var productToDelete = viewModel.productData.filter { $0.favorited == true }[indexPath.row]
            productToDelete.favorited = false
            tableView.deleteRows(at: [indexPath], with: .fade)
            ParserforFav.shared.writeData(to: "productLocal.json", data: viewModel.productData)
            hideNoFavoriteLabel()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
}

