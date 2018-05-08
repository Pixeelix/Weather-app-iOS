//
//  RegisterAccountViewController.swift
//  WeatherMP
//
//  Copyright © 2018 Martin Pihooja. All rights reserved.
//

import UIKit

class RegisterAccountViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //If register button pressed
    @IBAction func registerButtonTapped(_ sender: Any)
    {
        let userName = userNameTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        //Check empty fields
        if ((userName?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!)
        {
            // Display aler message
            displayMyAlertMessage(userMessage: "Kõik väljad peavad olema täidetud");
            return;
        }
        // Check if passwords match
        if (userPassword != userRepeatPassword)
        {
            // Display alert message
            displayMyAlertMessage(userMessage: "Sisestatud paroolid on erinevad");
            return;
        }
        
        // Store data
        UserDefaults.standard.set(userName, forKey: "userName");
        UserDefaults.standard.set(userPassword, forKey: "userPassword");
        UserDefaults.standard.synchronize();
        
        // Display confirmation message
        
        let myAlert = UIAlertController(title: "Palju Õnne", message: "Kasutaja loomine õnnestus", preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
           
            self.dismiss(animated: true, completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
            
        
    }
    // Configure Arlert message box
    func displayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title: "Viga kasutaja loomisel !", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion:nil);
    }
    
    // I alredy have an account button goes back to sign in page
    @IBAction func userAlreadyHaveAccountBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    // Hide keyboard if user clicks outside of textbox 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    


}
