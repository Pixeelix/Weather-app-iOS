//
//  UserProfileViewController.swift
//  WeatherMP
//
//  Copyright © 2018 Martin Pihooja. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameOutLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide back button
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        // Show user profile image
        userProfileImage.isUserInteractionEnabled = true
        userProfileImage.layer.cornerRadius = userProfileImage.bounds.height / 2
        userProfileImage.clipsToBounds = true
        
        let data = UserDefaults.standard.object(forKey: "userProfileImage") as! NSData
        userProfileImage.image = UIImage(data: data as Data)
        // Show username
        userNameOutLabel.text = UserDefaults.standard.string(forKey: "userName")
        
    }

    
    @IBAction func logOutButtonPressed(_ sender: Any){
        
        // Set user logged in flag to false and hide current page
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn");
        UserDefaults.standard.synchronize();
        
         self.navigationController?.popViewController(animated: true)
    }
    

}
