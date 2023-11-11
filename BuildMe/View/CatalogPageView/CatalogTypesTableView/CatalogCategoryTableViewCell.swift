//
//  CatalogCategoryTableViewCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class CatalogCategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionViewm: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewm.dataSource = self
        collectionViewm.delegate = self
        
        let nib = UINib(nibName: "\(CatalogTypesCollectionViewCell.self)", bundle: nil)
        collectionViewm.register(nib, forCellWithReuseIdentifier: "CatalogTypesCollectionViewCell")
    }

    
}


extension CatalogCategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewm.dequeueReusableCell(withReuseIdentifier: "\(CatalogTypesCollectionViewCell.self)", for: indexPath) as! CatalogTypesCollectionViewCell

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 120, height: 50)
    }
    
    
}

