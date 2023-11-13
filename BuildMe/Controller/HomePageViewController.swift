//
//  HomePageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var tableViewm: UITableView!
    
    var viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BuildMe"
        
        setTableRegister()
        
    }
    
    func setTableRegister () {
        tableViewm.delegate = self
        tableViewm.dataSource =  self
        
        tableViewm.register(UINib(nibName: "\(HomeProductTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "HomeProductTableViewCell")
        
        tableViewm.register(UINib(nibName: "\(HomeCategoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "HomeCategoryTableViewCell")
    }
    
    
    @IBAction func profileButtonClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "ProfilePageViewController") as! ProfilePageViewController
        navigationController?.show(controller, sender: nil)
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
            cell.viewModel.categoryData = viewModel.categoryData
            return cell
            
        case 1:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeProductTableViewCell.self)", for: indexPath) as! HomeProductTableViewCell
            cell.viewModel.filteredProducts = viewModel.newProduct()
            return cell
        case 2:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeProductTableViewCell.self)", for: indexPath) as! HomeProductTableViewCell
            cell.viewModel.filteredProducts = viewModel.discountedProduct()
            return cell
        case 3:
            let cell = tableViewm.dequeueReusableCell(withIdentifier: "\(HomeProductTableViewCell.self)", for: indexPath) as! HomeProductTableViewCell
            cell.viewModel.filteredProducts = viewModel.featuredProduct()
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
    
    
    
    
    
    
    
    
    
    
    
    
   
