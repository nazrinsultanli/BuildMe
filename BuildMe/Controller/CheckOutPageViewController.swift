//
//  CheckOutPageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 22.11.23.
//

import UIKit

class CheckOutPageViewController: UIViewController {
    @IBOutlet weak var cvvWrong: UILabel!
    
    @IBOutlet weak var monthAndYearWrong: UILabel!
    @IBOutlet weak var cardNumberWrong: UILabel!
    @IBOutlet weak var cvv: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    
    var total: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
    }
    func checkWrongData() {
        if cardNumber.text?.count != 16{
            cardNumberWrong.isHidden = false
        }
        if cvv.text?.count != 3{
            cvvWrong.isHidden = false
        }
        let currentYear = Calendar(identifier: .gregorian).component(.year, from: Date())
        let currentMonth = Calendar(identifier: .gregorian).component(.month, from: Date())
        if let enteredYearText = year.text, let enteredYear = Int(enteredYearText), let enteredMonthText = month.text, let enteredMonth = Int(enteredMonthText) {
            if currentYear > enteredYear && (enteredMonth > 13 || enteredMonth < 0){
                monthAndYearWrong.text = "Year and Month Wrong"
                monthAndYearWrong.isHidden = false
            } else if currentYear > enteredYear {
                monthAndYearWrong.text = "Year Wrong"
                monthAndYearWrong.isHidden = false
            }
            else if (currentMonth > enteredMonth) || (enteredMonth > 12 && enteredMonth < 1){
               monthAndYearWrong.text = "Month Wrong"
               monthAndYearWrong.isHidden = false
           }
        }
    }
    
    
    @IBAction func checkOutButton(_ sender: Any) {
        checkWrongData()
        
        let alert = UIAlertController(title: "SuccessFull", message: "\(total) $ is paid!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
            self.tabBarController?.selectedIndex = 0
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(okButton)
        present(alert,animated: true)
        
        

    }
    
}
