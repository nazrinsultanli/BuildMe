//
//  LoginPageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 10.11.23.
//

import UIKit
import Lottie
class LoginPageViewController: UIViewController {
    @IBOutlet weak var lottieView: LottieAnimationView!
    @IBOutlet weak var wrongPasswordLabel: UILabel!
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var viewModel = LoginPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        wrongPasswordLabel.isHidden = true
        lottieView.play()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel = LoginPageViewModel()
    }
    private func setupUI() {
            emailTextField.layer.cornerRadius = 25
            emailTextField.layer.borderWidth = 1
            emailTextField.layer.borderColor = UIColor.white.cgColor
            
            passwordTextField.layer.cornerRadius = 25
            passwordTextField.layer.borderWidth = 1
            passwordTextField.layer.borderColor = UIColor.white.cgColor
            
            buttonView.layer.cornerRadius = 25
            buttonView.layer.borderWidth = 1
            
            emailTextField.layer.masksToBounds = true
            passwordTextField.layer.masksToBounds = true
            buttonView.layer.masksToBounds = true
            
        }
    
    @IBAction func logInClicked(_ sender: Any) {
        UserDefaults.standard.setValue(true, forKey: "LoggedIn")
        UserDefaults.standard.setValue(emailTextField.text, forKey: "savedEmail")
        
        if viewModel.userData.contains(where: {$0.email == emailTextField.text && $0.password == passwordTextField.text}){
            let controller = storyboard?.instantiateViewController(identifier: "HomePageViewController") as! HomePageViewController
            navigationController?.show(controller, sender: nil)
        }
        else{
            wrongPasswordLabel.isHidden = false
        }
    }
    
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        
        let registerPage = storyboard?.instantiateViewController(withIdentifier: "RegisterPageViewController") as! RegisterPageViewController
        //--3--- burada cagirmaq
        registerPage.registerButtonClickedCallBackLogin = { a, b in
            self.emailTextField?.text = a
            self.passwordTextField?.text = b
        }
        navigationController?.show(registerPage, sender: nil)
    }
}


extension LoginPageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder() // tek ishletsen, hansi textfielde bassan acilirbaglanir
        wrongPasswordLabel.isHidden = true
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
}
