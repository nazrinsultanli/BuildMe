//
//  CatalogProductTableCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class CatalogProductTableCell: UITableViewCell {
    @IBOutlet weak var collectionViem: UICollectionView!
    
    var viewModel = CatalogPageViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionView()
        }
    
    func setCollectionView(){
        collectionViem.dataSource = self
        collectionViem.dataSource = self
        
        let nib = UINib(nibName: "\(CategoryProductCollectionViewCell.self)", bundle: nil)
        collectionViem.register(nib, forCellWithReuseIdentifier: "CategoryProductCollectionViewCell")
    }

}



extension CatalogProductTableCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filteredProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryProductCollectionViewCell", for: indexPath) as! CategoryProductCollectionViewCell
        cell.setCatalogProduct(product: viewModel.filteredProduct[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 180, height: 180)
    }
    
    
    
}
