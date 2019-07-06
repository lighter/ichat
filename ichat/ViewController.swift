//
//  ViewController.swift
//  icaht
//
//  Created by lighter on 2019/6/9.
//  Copyright © 2019 lighter. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPassworTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: IBAction
    @IBAction func login(_ sender: Any) {
        dismissKeyboard()
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            login()
        } else {
            ProgressHUD.showError("Email and Password is missing!")
        }
    }
    
    @IBAction func register(_ sender: Any) {
        dismissKeyboard()
        
        if emailTextField.text != "" && passwordTextField.text != "" && repeatPassworTextField.text != "" {
            
            if passwordTextField.text == repeatPassworTextField.text {
                register()
            } else {
                ProgressHUD.showError("Password don't match")
            }

        } else {
            ProgressHUD.showError("All fields are required!")
        }
    }
    
    @IBAction func backgroundTap(_ sender: Any) {
    }
    
    // MARK: HelperFunctions
    func login() {
        ProgressHUD.show("Login...")
        
        FUser.loginUserWith(email: emailTextField.text!, password: passwordTextField.text!) { (error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            
            self.goToApp()
        }
    }
    
    func register() {
        performSegue(withIdentifier: "welcomeToFinishReg", sender: self)
        cleanTextField()
        dismissKeyboard()
    }
    
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func cleanTextField() {
        emailTextField.text = ""
        passwordTextField.text = ""
        repeatPassworTextField.text = ""
    }
    
    // MARK: goToApp
    func goToApp() {
        ProgressHUD.dismiss()
        cleanTextField()
        dismissKeyboard()
        
        // present app here
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "welcomeToFinishReg" {
            let vc = segue.destination as! FinishRegistrationViewController
            vc.email = emailTextField.text!
            vc.password = passwordTextField.text!
        }
    }
}

