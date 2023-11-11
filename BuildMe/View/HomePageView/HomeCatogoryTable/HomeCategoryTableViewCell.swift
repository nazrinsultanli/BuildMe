//
//  HomeCategoryTableViewCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class HomeCategoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionViewm: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewm.dataSource = self
        collectionViewm.delegate = self
        
        let nib = UINib(nibName: "\(HomeCategoryHeaderCell.self)", bundle: nil)
        collectionViewm.register(nib, forCellWithReuseIdentifier: "HomeCategoryHeaderCell")
        }
}


extension HomeCategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewm.dequeueReusableCell(withReuseIdentifier: "\(HomeCategoryHeaderCell.self)", for: indexPath) as! HomeCategoryHeaderCell
//        cell.setUpHeader(title: "aa", image: "plus")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 80, height: 80)
    }
    
    
}

