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
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var changeProfileImageButton: UIButton!
    
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        userProfileImage.isUserInteractionEnabled = true
        userProfileImage.addGestureRecognizer(imageTap)
        userProfileImage.layer.cornerRadius = userProfileImage.bounds.height / 2
        userProfileImage.clipsToBounds = true
        changeProfileImageButton.addTarget(self, action: #selector (openImagePicker), for: .touchUpInside)
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
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
    
    // Open image picker if User taps the image area
    @objc func openImagePicker(_ sender:Any) {
        // Open Image Picker
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    // Hide keyboard if user clicks outside of textbox 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension RegisterAccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.userProfileImage.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
