//
//  SignInViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 30/04/2022.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sign in"
        
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func butttonSignInTapped(_ sender: UIButton) {
        
        if emailTextField.text!.count > 0 {
            
            if passwordTextField.text!.count > 0 {
            
                let user = User(email: emailTextField.text, password: passwordTextField.text, device_name: UIDevice.current.name)
                user.device_name = "iphone-xr-piotr"
                
                NetworkService().signInUser(user: user) { success in
                    
                    if success {
                    
                        print("Sucessfully login")
                        self.performSegue(withIdentifier: Constants.AppNames.sequeToTabBarControllerFromSignIn, sender: self)
                    } else {
                        
                        let alert = UIAlertController(title: "Something went wrong, please try again.", message: nil, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                            NSLog("The \"OK\" alert occured.")
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } else {
                
                let alert = UIAlertController(title: "Please provide password.", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            
            let alert = UIAlertController(title: "Please provide email.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func createNewAccountButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: Constants.AppNames.sequeToRegisterIdentifier, sender: self)
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
