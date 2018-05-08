//
//  LogInViewController.swift
//  WeatherMP
//
//  Created by Greete Jõgi on 08/05/2018.
//  Copyright © 2018 Martin Pihooja. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Login button pressed
    @IBAction func logInButtonTapped(_ sender: Any)
    {
        let userName = userNameTextField.text;
        let userPassword = userPasswordTextField.text;
        
        let userNameStored = UserDefaults.standard.string(forKey: "userName");
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
    
        // Check if username and password are correct
        if(userNameStored == userName)
        {
            if(userPasswordStored == userPassword)
            {
                // Login was successfull
            }
        }
    }
    
    // Hide keyboard if user clicks outside of textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    


}
