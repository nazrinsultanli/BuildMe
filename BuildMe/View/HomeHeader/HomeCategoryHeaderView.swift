//
//  HomeCategoryHeaderView.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 09.11.23.
//

import UIKit

class HomeCategoryHeaderView: UICollectionReusableView {
    @IBOutlet weak var collectionViewHeader: UICollectionView!
    
    override func awakeFromNib() {
            super.awakeFromNib()


        let nib = UINib(nibName: "\(HomeCategoryHeaderCell.self)", bundle: nil)
        collectionViewHeader.register(nib, forCellWithReuseIdentifier: "HomeCategoryHeaderCell")
        }

    

    
}


extension HomeCategoryHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewHeader.dequeueReusableCell(withReuseIdentifier: "\(HomeCategoryHeaderCell.self)", for: indexPath) as! HomeCategoryHeaderCell
        cell.setUpHeader(title: "aa", image: "plus")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 54, height: collectionViewHeader.frame.height)
    }
    
    
}
