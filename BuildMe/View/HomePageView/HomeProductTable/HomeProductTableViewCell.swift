//
//  HomeProductTableViewCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class HomeProductTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var collectionViewm: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewm.dataSource = self
        collectionViewm.dataSource = self
        
        let nib = UINib(nibName: "\(HomeHorizontalItemCell.self)", bundle: nil)
        collectionViewm.register(nib, forCellWithReuseIdentifier: "HomeHorizontalItemCell")
        }

    
}

extension HomeProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeHorizontalItemCell", for: indexPath) as! HomeHorizontalItemCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 320, height: 200)
    }
    
    
    
}
