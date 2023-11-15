//
//  HomeCategoryTableViewCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

//protocol HomeCategoryDelegate{
//    func categorySelected(selectedCategory: CategoryProduct)
//}

class HomeCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionViewm: UICollectionView!
    
    var viewModel = HomeCategoryTableViewModel()
   // var delegate: HomeCategoryDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionView()
        
    }
    func setCollectionView(){
        collectionViewm.dataSource = self
        collectionViewm.delegate = self
        
        let nib = UINib(nibName: "\(HomeCategoryHeaderCell.self)", bundle: nil)
        collectionViewm.register(nib, forCellWithReuseIdentifier: "HomeCategoryHeaderCell")
        }
}


extension HomeCategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewm.dequeueReusableCell(withReuseIdentifier: "\(HomeCategoryHeaderCell.self)", for: indexPath) as! HomeCategoryHeaderCell
        cell.setHomeCategoryData(category: viewModel.categoryData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 80, height: 80)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedCategory = viewModel.categoryData[indexPath.item].categoryType
            NotificationCenter.default.post(name: Notification.Name("CategorySelected"), object: selectedCategory)
        }
}

