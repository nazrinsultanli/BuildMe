//
//  CatalogCategoryHeaderReusableView.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 22.11.23.
//

import UIKit

class CatalogCategoryHeaderReusableView: UICollectionReusableView {
    var viewModel = CatalogPageViewModel()
    @IBOutlet weak var collectionViewm: UICollectionView!
    var selectedCategoryforHome: ((CategoryProduct) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTableView()
    }
    
    func setTableView() {
        collectionViewm.register(UINib(nibName: "\(CatalogTypesCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CatalogTypesCollectionViewCell.self)")
        
        collectionViewm.dataSource = self
        collectionViewm.delegate = self
    }
}


extension CatalogCategoryHeaderReusableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let type = viewModel.categoryData[indexPath.item].categoryType else { return }
        selectedCategoryforHome?(type)
    }
    
}

