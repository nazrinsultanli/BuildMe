//
//  CatalogPageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class CatalogPageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Catalog"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
//        collectionView.register(UINib(nibName: "CatalogTypesViewCell", bundle: nil), forCellWithReuseIdentifier: "CatalogTypesViewCell")
        collectionView.register(UINib(nibName: "HomeHorizontalItemCell", bundle: nil), forCellWithReuseIdentifier: "HomeHorizontalItemCell")
        
    }
}


extension CatalogPageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // One section for catalog types, another for catalog items
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        else{
            return 5
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            // Return a catalog type cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatalogTypesViewCell", for: indexPath) as! CatalogTypesViewCell
            // Configure the cell for catalog types
            return cell
        } else {
            // Return a catalog item cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeHorizontalItemCell", for: indexPath) as! HomeHorizontalItemCell
            // Configure the cell for catalog items
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("Size calculation for indexPath: \(indexPath)")

            if indexPath.section == 0 {
                // Size for horizontal cell
                
                return CGSize(width: collectionView.frame.width, height: 100)
            } else {
                // Size for vertical cell with 2 columns
                let width = (collectionView.frame.width - 20) / 2 // Subtract 20 for spacing between items
                return CGSize(width: width, height: width) // Assuming square items, adjust height as needed
            }
        }
    
}


