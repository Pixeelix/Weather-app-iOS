//
//  UserProfileViewController.swift
//  WeatherMP
//
//  Created by Greete Jõgi on 09/05/2018.
//  Copyright © 2018 Martin Pihooja. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        
        if(!isUserLoggedIn)
        {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any){
        
        // Set user logged in flag to false and hide current page
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn");
        UserDefaults.standard.synchronize();
        
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
    

}
