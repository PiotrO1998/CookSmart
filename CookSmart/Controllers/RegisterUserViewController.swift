//
//  RegisterUserViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 30/04/2022.
//

import UIKit

class RegisterUserViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.layer.cornerRadius = 5
        firstNameTextField.layer.borderWidth = 1
        firstNameTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        surnameTextField.layer.cornerRadius = 5
        surnameTextField.layer.borderWidth = 1
        surnameTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        usernameTextField.layer.cornerRadius = 5
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        if firstNameTextField.text!.count > 0 {
            
            if surnameTextField.text!.count > 0 {
                
                if usernameTextField.text!.count > 0 {
                    
                    if emailTextField.text!.count > 0 {
                        
                        if passwordTextField.text!.count > 0 {
                            
                            let user = User(first_name: firstNameTextField.text, surname: surnameTextField.text, username: usernameTextField.text, email: emailTextField.text, password: passwordTextField.text, device_name: UIDevice.current.name)
                            
                            
                            NetworkService().registerUser(user: user) { success in
                                
                                if success {
                                    
                                    
                                    print("Sucessfully register")
                                    self.getUserProfile()
                                    let storyborad = UIStoryboard(name: "Main", bundle: nil)
                                    let homeController = storyborad.instantiateViewController(withIdentifier: "Home")
                                    homeController.modalPresentationStyle = .fullScreen
                                    self.present(homeController, animated: true, completion: nil)
                                    
                                } else {
                                    
                                    self.showAlert(text: "Incorrect credentials.")
                                }
                                
                            }
                            
                            
                        } else {
                            
                            showAlert(text: "Please provide Password")
                        }
                    } else {
                        
                        showAlert(text: "Please provide Email.")
                    }
                } else {
                    
                    showAlert(text: "Please provode Username")
                }
                
            } else {
                
                showAlert(text: "Please provide Surname")
            }
        } else {
            
            showAlert(text: "Please provide First Name")
        }
    }
    
    func showAlert(text: String) {
        
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }

   
    private func getUserProfile() {
        
        NetworkService().getUserProfile { user in
            
            if user != nil {
                
                print("successfully store user")
                CurrentUserDefaults.shared.saveCurrentUserToUserDefaults(user: user!)
            }
        }
    }

}
