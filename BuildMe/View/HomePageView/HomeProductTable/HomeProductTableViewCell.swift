//
//  HomeProductTableViewCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class HomeProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionViewm: UICollectionView!
    
    var viewModel = HomeProductTableViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCollectionView()
    }
    
    func setCollectionView(){
        collectionViewm.dataSource = self
        collectionViewm.dataSource = self
        
        let nib = UINib(nibName: "\(HomeHorizontalItemCell.self)", bundle: nil)
        collectionViewm.register(nib, forCellWithReuseIdentifier: "HomeHorizontalItemCell")
        }
}

extension HomeProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeHorizontalItemCell", for: indexPath) as! HomeHorizontalItemCell
        cell.setHomeProductData(product: viewModel.filteredProducts[indexPath.item])
        print("pdrd")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 250, height: 200)
    }
    
    
    
}
