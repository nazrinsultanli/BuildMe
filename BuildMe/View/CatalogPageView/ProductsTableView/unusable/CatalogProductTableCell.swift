////
////  CatalogProductTableCell.swift
////  BuildMe
////
////  Created by Nazrin Sultanlı on 11.11.23.
////
//
//import UIKit
//
//class CatalogProductTableCell: UITableViewCell {
//    @IBOutlet weak var collectionViem: UICollectionView!
//    
//    var viewModel = CatalogProductViewModel()
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setCollectionView()
//        }
//    
//    func setCollectionView(){
//        collectionViem.delegate = self
//        collectionViem.dataSource = self
//        
//        let nib = UINib(nibName: "\(CategoryProductCollectionViewCell.self)", bundle: nil)
//        collectionViem.register(nib, forCellWithReuseIdentifier: "CategoryProductCollectionViewCell")
//    }
//
//}
//
//
//
//extension CatalogProductTableCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        viewModel.filteredProducts.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryProductCollectionViewCell", for: indexPath) as! CategoryProductCollectionViewCell
//        cell.setCatalogProduct(product: viewModel.filteredProducts[indexPath.item])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 180, height: 180)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let selectedProduct = viewModel.filteredProducts[indexPath.item]
//            NotificationCenter.default.post(name: Notification.Name("ProductSelected"), object: selectedProduct)
//        }
//    
//}
//
//
