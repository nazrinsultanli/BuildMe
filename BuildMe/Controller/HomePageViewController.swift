//
//  HomePageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var tableViewm: UITableView!
    
    var viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BuildMe"
        
        setTableRegister()
        
  

        NotificationCenter.default.addObserver(self, selector: #selector(categorySelected(_:)), name: Notification.Name("CategorySelected"), object: nil)
                
        NotificationCenter.default.addObserver(self, selector: #selector(productSelected(_:)), name: Notification.Name("ProductSelectedFromHome"), object: nil)
           
        
    }
    
    
    @objc func productSelected(_ notification: Notification) {
            if let selectedProduct = notification.object as? PRODUCTJs {
                let productPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductPageController") as! ProductPageController
                productPageVC.viewModel.receivedProductId = selectedProduct.idProduct
                navigationController?.pushViewController(productPageVC, animated: true)
            }
        
        }

        @objc func categorySelected(_ notification: Notification) {
            if let selectedCategory = notification.object as? CategoryProduct {
                let catalogageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CatalogPageViewController") as! CatalogPageViewController
                catalogageVC.viewModel.selectedCategoryType = selectedCategory
                navigationController?.pushViewController(catalogageVC, animated: true)
                
            }
        }

        deinit {
            // Remove the observer to avoid memory leaks
            NotificationCenter.default.removeObserver(self, name: Notification.Name("CategorySelected"), object: nil)
            NotificationCenter.default.removeObserver(self, name: Notification.Name("ProductSelected"), object: nil)
        }
    
    func setTableRegister () {
        tableViewm.delegate = self
        tableViewm.dataSource =  self
        
        tableViewm.register(UINib(nibName: "\(HomeProductTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "HomeProductTableViewCell")
        
        tableViewm.register(UINib(nibName: "\(HomeCategoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "HomeCategoryTableViewCell")
    }
    
    
    @IBAction func profileButtonClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "ProfilePageViewController") as! ProfilePageViewController
        navigationController?.show(controller, sender: nil)
    }
    
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return ""
        case 1:
            return "New Products"
        case 2:
            return "Discounted Products"
        case 3:
            return "Featured Products"
        default:
            return "-----"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section ) {
        case 0:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeCategoryTableViewCell.self)", for: indexPath) as! HomeCategoryTableViewCell
            cell.viewModel.categoryData = viewModel.categoryData
            return cell
        
        case 1:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeProductTableViewCell.self)", for: indexPath) as! HomeProductTableViewCell
            cell.viewModel.filteredProducts = viewModel.newProduct() // Update with your JSON data
            return cell
        case 2:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeProductTableViewCell.self)", for: indexPath) as! HomeProductTableViewCell
            cell.viewModel.filteredProducts = viewModel.discountedProduct() // Update with your JSON data
            return cell
        case 3:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeProductTableViewCell.self)", for: indexPath) as! HomeProductTableViewCell
            cell.viewModel.filteredProducts = viewModel.featuredProduct() // Update with your JSON data
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            return 100
            
        default:
            return 200
        }
    }
}
 
