//
//  RegisterPageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    
//    var viewModel = RegisterPageViewModel()
    var userStorage = UserHelper()
    
    //--1--
    var registerButtonClickedCallBackLogin: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"

     
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        
        let enteredFullName = fullNameTextField.text ?? ""
        let enteredEmail = emailTextField.text ?? ""
        let enteredPassword = passwordTextField.text ?? ""
        
        
        if userStorage.fetch().contains(where: {$0.email == emailTextField.text}){
            emailError.isHidden = true
        }
        else{
            let newUser = User(fullName: enteredFullName, 
                               email: enteredEmail, 
                               password: enteredPassword)
//            viewModel.userData.append(newUser)
//            viewModel.saveItems()
            userStorage.saveItems(userData: newUser)
        }
        
        
        
        //--2--
        registerButtonClickedCallBackLogin?(enteredEmail, enteredPassword)
        navigationController?.popViewController(animated: true)

    }
    
    
}
