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
    
    @IBOutlet weak var TestImageOutput: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        let data = UserDefaults.standard.object(forKey: "userProfileImage") as! NSData
        TestImageOutput.image = UIImage(data: data as Data)
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
                // Login was successfull - set the flag and hide login page
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
                UserDefaults.standard.synchronize();
                
                 self.navigationController?.popViewController(animated: true)
            }
            // Wrong Password Alert
            else
            {
                let myAlert = UIAlertController(title: "Viga parooli sisestamisel !", message: "Palu proovi uuesti", preferredStyle: UIAlertControllerStyle.alert);
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
                myAlert.addAction(okAction);
                self.present(myAlert, animated:true, completion:nil);
            }
        }
        // Wrong User Name Alert
        else
        {
            let myAlert = UIAlertController(title: "Viga kasutaja sisestamisel !", message: "Palu proovi uuesti", preferredStyle: UIAlertControllerStyle.alert);
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
            myAlert.addAction(okAction);
            self.present(myAlert, animated:true, completion:nil);
        }
    }
    
    // Hide keyboard if user clicks outside of textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    


}
