//
//  FinishRegistrationViewController.swift
//  ichat
//
//  Created by lighter on 2019/6/28.
//  Copyright © 2019 lighter. All rights reserved.
//

import UIKit

class FinishRegistrationViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var email: String!
    var password: String!
    var avatarImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: IBActions
    @IBAction func cancelBtnPress(_ sender: Any) {
    }
    
    @IBAction func doneBtnPress(_ sender: Any) {
    }
}
