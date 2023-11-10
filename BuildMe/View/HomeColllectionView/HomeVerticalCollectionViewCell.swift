//
//  HomeVerticalCollectionViewCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 10.11.23.
//

import UIKit

class HomeVerticalCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var horizontalCollectionView: UICollectionView!

    override func awakeFromNib() {
            super.awakeFromNib()


        let nib = UINib(nibName: "\(HomeHorizontalItemCell.self)", bundle: nil)
        horizontalCollectionView.register(nib, forCellWithReuseIdentifier: "HomeHorizontalItemCell")
        }

    // Implement UICollectionViewDataSource methods for the horizontal collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of items in the horizontal collection view
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Return a configured cell for the horizontal collection view
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeHorizontalItemCell", for: indexPath) as! HomeHorizontalItemCell
        // Configure the cell (e.g., set up the content of the horizontal cell)
        return cell
    }

    // Implement UICollectionViewDelegate methods for the horizontal collection view if needed
}
