//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        //TODO: Set up a new user on our Firbase database
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if (error != nil) {
                    print(error!)
                    SVProgressHUD.dismiss()
                } else {
                    print("Registration sucessful")
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
        }
        
        

        
        
    } 
    
    
}
