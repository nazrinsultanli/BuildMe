//
//  HomePageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var collectionViewm: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BuildMe"
        collectionViewm.delegate = self
        collectionViewm.dataSource =  self
        //button.imageEdgeInsets = UIEdgeInsetsMake(25,25,25,25)
        configure()

        // Do any additional setup after loading the view.
    }
    
//    func configure (){
////        collectionViewm.register(UINib(nibName: "\(HomeCategoryHeaderReusableView.self)", bundle: nil), forCellWithReuseIdentifier: "HomeCategoryHeaderReusableView")
//        
//        
//    }
    
    func configure () {
//        collectionViewHeader.register(UINib(nibName: "\(HomeCategoryHeaderCell.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeCategoryHeaderCell")
    }



}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewm.dequeueReusableCell(withReuseIdentifier: "HomeVerticalCollectionViewCell", for: indexPath)
        cell.layer.cornerRadius = 35
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionViewm.frame.width*0.835, height: 237)
    }
    
    // header
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionViewm.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HomeCategoryHeaderView.self)", for: indexPath) as! HomeCategoryHeaderView
       
        
        
        return header
    }
}
