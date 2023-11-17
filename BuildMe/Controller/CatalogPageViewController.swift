//
//  CatalogPageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class CatalogPageViewController: UIViewController {
    
    @IBOutlet weak var tableViewm: UITableView!
    
    var viewModel = CatalogPageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Catalog"
        setTableView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(productSelected(_:)), name: Notification.Name("ProductSelected"), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(categorySelectedfromCatalog(_:)), name: Notification.Name("SelectedCategoryfromCatalog"), object: nil)

    }
    @objc func productSelected(_ notification: Notification) {
            if let selectedProduct = notification.object as? Product {
                // Navigate to the ProductPageController and pass the selected product
                let productPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductPageController") as! ProductPageController
                productPageVC.receivedProductId = selectedProduct.idProduct
                navigationController?.pushViewController(productPageVC, animated: true)
            }
        }

    
    @objc func categorySelectedfromCatalog(_ notification: Notification) {
            if let category = notification.object as? CategoryProduct {
                // Navigate to the ProductPageController and pass the selected product
                let catalogPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CatalogPageViewController") as! CatalogPageViewController
                catalogPageVC.viewModel.selectedCategoryType = category
                navigationController?.show(catalogPageVC, sender: nil)
                
                //pushViewController(catalogPageVC, animated: true)
            }
        }
        deinit {
            // Remove the observer to avoid memory leaks
            NotificationCenter.default.removeObserver(self, name: Notification.Name("ProductSelected"), object: nil)
            
            NotificationCenter.default.removeObserver(self, name: Notification.Name("SelectedCategoryfromCatalog"), object: nil)
        }
    
    
    
    
        func setTableView(){
            tableViewm.delegate = self
            tableViewm.dataSource = self
            
            tableViewm.register(UINib(nibName: "\(CatalogCategoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "CatalogCategoryTableViewCell")
            tableViewm.register(UINib(nibName: "\(CatalogProductTableCell.self)", bundle: nil), forCellReuseIdentifier: "CatalogProductTableCell")
        }
        
    }
    
    
    
    
    
    extension CatalogPageViewController: UITableViewDelegate, UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            2
        }
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            switch (section) {
            case 0:
                return ""
            case 1:
                return "  "
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
                let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(CatalogCategoryTableViewCell.self)", for: indexPath) as! CatalogCategoryTableViewCell
                cell.viewModel.categoryData = viewModel.categoryData
                return cell
                
            case 1:
                let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(CatalogProductTableCell.self)", for: indexPath) as! CatalogProductTableCell
                cell.viewModel.filteredProducts = viewModel.filteredData()
                return cell
            default:
                return UITableViewCell()
            }
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch (indexPath.section) {
            case 0:
                return 50
                
            default:
                return 700
            }
        }
        
        
        
        
        
    }



