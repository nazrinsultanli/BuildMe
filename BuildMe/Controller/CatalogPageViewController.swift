//
//  CatalogPageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class CatalogPageViewController: UIViewController {
    @IBOutlet weak var tableViewm: UITableView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Catalog"
        tableViewm.delegate = self
        tableViewm.dataSource = self
        

        tableViewm.register(UINib(nibName: "\(CatalogCategoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "CatalogCategoryTableViewCell")
        
        tableViewm.register(UINib(nibName: "\(CatalogProductTableCell.self)", bundle: nil), forCellReuseIdentifier: "CatalogProductTableCell")
        
        
    }
}


extension CatalogPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return ""
        case 1:
            return "  "
        default:
            return "-----"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch (indexPath.section ) {
        case 0:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(CatalogCategoryTableViewCell.self)", for: indexPath) as! CatalogCategoryTableViewCell
            //        cell.setUpHeader(title: "aa", image: "plus")
            return cell
            
        case 1:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(CatalogProductTableCell.self)", for: indexPath) as! CatalogProductTableCell
            //        cell.setUpHeader(title: "aa", image: "plus")
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            return 50
            
        default:
            return 700
        }
    }
    
}


