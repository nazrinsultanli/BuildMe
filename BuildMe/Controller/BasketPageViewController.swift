//
//  BasketPageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 04.11.23.
//

import UIKit

class BasketPageViewController: UIViewController {

    @IBOutlet weak var checkOutButton: UIButton!
    @IBOutlet weak var emptyBasketLabel: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var totalOrderPrice: ((Double) -> Void)?
    var viewModel = BasketPageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        calculateTotal()
        notBasketSetUpUi()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.refreshData()
        notBasketSetUpUi()
        calculateTotal()
        tableView.reloadData()
    }
    
    func notBasketSetUpUi(){
        if !viewModel.productData.filter({ $0.basketed == true }).isEmpty {
            emptyBasketLabel.isHidden = true
            checkOutButton.isHidden = false
            totalValue.isHidden = false
        }else{
            emptyBasketLabel.isHidden = false
  
            checkOutButton.isHidden = true
            totalValue.isHidden = true
        }
    }
    
    func calculateTotal() {
            viewModel.total = 0 // Reset total before calculating again
            
            for product in viewModel.productData where product.basketed {
                let totalPriceValue = Double(product.order) * product.price
                viewModel.total += totalPriceValue
            }
            
            totalValue.text = "\(viewModel.total) $"
        totalOrderPrice?(viewModel.total)
        }
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BasketTableCell", bundle: nil), forCellReuseIdentifier: "BasketTableCell")

        tableView.isEditing = true
        tableView.reloadData()
    }

    @IBAction func checkOutButtonClicked(_ sender: Any) {
        let cv = storyboard?.instantiateViewController(identifier: "CheckOutPageViewController") as! CheckOutPageViewController
        navigationController?.show(cv, sender: nil)
    }
    
}


extension BasketPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.productData.filter({ $0.basketed == true }).count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableCell", for: indexPath) as! BasketTableCell
        cell.setBasketTable(product: viewModel.productData.filter({ $0.basketed == true })[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let productToDelete = viewModel.productData.filter { $0.basketed == true }[indexPath.row]
            
            productToDelete.basketed = false
   
            tableView.deleteRows(at: [indexPath], with: .fade)

            ParserforFav.shared.writeData(to: "productLocal.json", data: viewModel.productData)
            calculateTotal()
            notBasketSetUpUi()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
