//
//  CatalogCategoryTableViewCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class CatalogCategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionViewm: UICollectionView!
    
    var viewModel = CatalogCategoryViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTableView()
    }
    
    func setTableView(){
        collectionViewm.dataSource = self
        collectionViewm.delegate = self
        
        let nib = UINib(nibName: "\(CatalogTypesCollectionViewCell.self)", bundle: nil)
        collectionViewm.register(nib, forCellWithReuseIdentifier: "CatalogTypesCollectionViewCell")
    }
    
}


extension CatalogCategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewm.dequeueReusableCell(withReuseIdentifier: "\(CatalogTypesCollectionViewCell.self)", for: indexPath) as! CatalogTypesCollectionViewCell
        cell.setCatalogCategoryData(category: viewModel.categoryData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 120, height: 50)
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let catalogPageViewController = storyboard.instantiateViewController(withIdentifier: "CatalogPageViewController") as! CatalogPageViewController
     
        catalogPageViewController.viewModel.selectedCategoryType = viewModel.categoryData[indexPath.item].categoryType
     
        self.window?.rootViewController?.show(catalogPageViewController, sender: nil)
        
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedCategory = viewModel.categoryData[indexPath.item].categoryType
            NotificationCenter.default.post(name: Notification.Name("SelectedCategoryfromCatalog"), object: selectedCategory)
        }
    
}

