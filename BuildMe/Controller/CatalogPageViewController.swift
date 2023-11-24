//
//  CatalogPageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class CatalogPageViewController: UIViewController {
    @IBOutlet weak var collectionViem: UICollectionView!
    var viewModel = CatalogPageViewModel()
    
    @IBOutlet weak var searchButton: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        title = "Catalog"
        viewModel.getData()
        collectionViem.reloadData()
    }
    
    func setCollectionView() {
        collectionViem.delegate = self
        collectionViem.dataSource = self
        let nib = UINib(nibName: "\(CategoryProductCollectionViewCell.self)", bundle: nil)
        collectionViem.register(nib, forCellWithReuseIdentifier: "CategoryProductCollectionViewCell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(forName: Notification.Name("CategorySelected"),
                                               object: nil,
                                               queue: nil) { notification in
            if let data = notification.userInfo as? [String: Any] {
                print("data: \(data)")
                self.viewModel.selectedCategoryType = data["category"] as? CategoryProduct
                self.viewModel.getData()
                self.collectionViem.reloadData()
            }
        }
    }
    
    @objc func productSelected(_ notification: Notification) {
        if let selectedProduct = notification.object as? PRODUCTJs {
            let productPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductPageController") as! ProductPageController
            productPageVC.viewModel.receivedProductId = selectedProduct.idProduct
            navigationController?.pushViewController(productPageVC, animated: true)
        }
    }
    
    @objc func categorySelectedfromCatalog(_ notification: Notification) {
        if let category = notification.object as? CategoryProduct {
            // Navigate to the ProductPageController and pass the selected product
            let catalogPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CatalogPageViewController") as! CatalogPageViewController
            catalogPageVC.viewModel.selectedCategoryType = category
            navigationController?.show(catalogPageVC, sender: nil)
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("ProductSelected"), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("SelectedCategoryfromCatalog"), object: nil)
    }
    
    @IBAction func searcButtonClicked(_ sender: Any) {
        guard let searchText = searchButton.text?.lowercased() else {
            return
        }
        viewModel.searchText(searchText: searchText)
        collectionViem.reloadData()
    }
}
extension CatalogPageViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filteredProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryProductCollectionViewCell", for: indexPath) as! CategoryProductCollectionViewCell
        cell.setCatalogProduct(product: viewModel.filteredProduct[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2-10, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = viewModel.filteredProduct[indexPath.item]
        let controller = storyboard?.instantiateViewController(identifier: "ProductPageController") as! ProductPageController
        controller.viewModel.receivedProductId = selectedProduct.idProduct
        navigationController?.show(controller, sender: nil)
    }
    
    //header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(CatalogCategoryHeaderReusableView.self)", for: indexPath) as! CatalogCategoryHeaderReusableView
        
        header.selectedCategoryforHome = { type in
            self.viewModel.selectedCategoryType = type
            self.viewModel.getData()
            self.collectionViem.reloadData()
        }
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 50)
    }
}


extension CatalogPageViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Typed string: \(string)")
        print("Full text in textField: \(textField.text ?? "")")
        searcButtonClicked(textField)
        return true
    }
}
