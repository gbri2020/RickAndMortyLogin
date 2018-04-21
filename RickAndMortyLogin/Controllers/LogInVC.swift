//
//  LogInVC.swift
//  RickAndMortyLogin
//
//  Created by Gustavs Brigmanis on 18/04/2018.
//  Copyright © 2018 Gustavs Brigmanis. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInVC: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func logIn(_ sender: UIButton) {
        
        if email.text == "" ||  password.text == "" {
            displayPopUp(title: "Missinig Info", message: "No fields can be emtpy")
        } else {
            Auth.auth().signIn(withEmail: email.text!, password: password.text!, completion: { (user, error) in
                if error != nil {
                    if let myErr = error?.localizedDescription{
                        self.displayPopUp(title: "ERROR", message: myErr)
                    }
                } else {
                    // perform login
                    print("£££££££££")
                    //print(user)
                    self.performSegue(withIdentifier: "successSegue", sender: nil)
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

