//
//  LoginToSeeHistoryViewController.swift
//  WeatherMP
//
//  Copyright © 2018 Martin Pihooja. All rights reserved.
//

import UIKit

class LoginToSeeHistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool)
    {
        // Check if user is logged in or not, if not logged in, stay on this page, otherwise move to the history page
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        
        if(!isUserLoggedIn)
        {
            // Stay on this page
        }
        else
        {
            self.performSegue(withIdentifier: "goToTheHistoryPage", sender: self)
        }
    }
    
}
