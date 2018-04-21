//
//  SignUpVC.swift
//  RickAndMortyLogin
//
//  Created by Gustavs Brigmanis on 18/04/2018.
//  Copyright © 2018 Gustavs Brigmanis. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func logIn(_ sender: UIButton) {
                
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if email.text == "" ||  password.text == "" {
            displayPopUp(title: "Check Yourself", message: "Please, fill in the required fields")
        } else {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: { (user, error) in
                if error != nil {
                    if let myErr = error?.localizedDescription{
                        self.displayPopUp(title: "Error", message: myErr)
                    }
                } else {
                    
                    Database.database().reference().child("users").child(user!.uid).child("email").setValue(self.email.text!)
                    
                    self.displayPopUp(title: "Success", message: "Registration success, now you can log in!")
                }
                
            })
        }
        
    }
    
    func displayPopUp(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    
    }
    
}
