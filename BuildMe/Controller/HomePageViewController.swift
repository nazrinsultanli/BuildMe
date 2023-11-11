//
//  HomePageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class HomePageViewController: UIViewController {

    
    @IBOutlet weak var tableViewm: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BuildMe"
        tableViewm.delegate = self
        tableViewm.dataSource =  self
        
        tableViewm.register(UINib(nibName: "\(HomeProductTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "HomeProductTableViewCell")
        
        tableViewm.register(UINib(nibName: "\(HomeCategoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "HomeCategoryTableViewCell")
        
        configure()

    }
    

    
    func configure () {

    }



}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return ""
        case 1:
            return "New Products"
        case 2:
            return "Discounted Products"
        case 3:
            return "Featured Products"
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
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeCategoryTableViewCell.self)", for: indexPath) as! HomeCategoryTableViewCell
            //        cell.setUpHeader(title: "aa", image: "plus")
            return cell
            
        case 1:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeProductTableViewCell.self)", for: indexPath) as! HomeProductTableViewCell
            //        cell.setUpHeader(title: "aa", image: "plus")
            return cell
        case 2:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeProductTableViewCell.self)", for: indexPath) as! HomeProductTableViewCell
            //        cell.setUpHeader(title: "aa", image: "plus")
            return cell
        case 3:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeProductTableViewCell.self)", for: indexPath) as! HomeProductTableViewCell
            //        cell.setUpHeader(title: "aa", image: "plus")
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            return 100
            
        default:
            return 200
        }
    }
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
   
