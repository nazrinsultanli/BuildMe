//
//  ProfilePageViewController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 13.11.23.
//

import UIKit

class ProfilePageViewController: UIViewController {
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var profileInfoView: UIView!
    @IBOutlet weak var signView: UIView!
    @IBOutlet weak var profileICon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nonSigned()

      
    }
    
    func nonSigned(){
        signView.isHidden = false
        profileInfoView.isHidden = true
        profileICon.image = UIImage(systemName: "person.crop.circle")
    }
    
    func signed(){
        profileInfoView.isHidden = false
        signView.isHidden = true
        profileICon.image = UIImage(systemName: "person.crop.circle.fill")
    }
    @IBAction func signUpButtonClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "RegisterPageViewController") as! RegisterPageViewController
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func logInButtonClicked(_ sender: Any) {
       
        let controller = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        navigationController?.show(controller, sender: nil)
    }
    
}
