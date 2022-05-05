//
//  ProfileViewController.swift
//  CookSmart
//
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        surnameTextField.delegate = self
        
        firstNameTextField.layer.cornerRadius = 5
        firstNameTextField.layer.borderWidth = 1
        firstNameTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        surnameTextField.layer.cornerRadius = 5
        surnameTextField.layer.borderWidth = 1
        surnameTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        print("Button save tapped")
        if firstNameTextField.text!.count > 0 {
            
            if surnameTextField.text!.count > 0 {
                
                var user = ReceivedUser()
                
                user.id = CurrentUserDefaults.shared.getCurrentUser()!.id
                user.first_name = firstNameTextField.text
                user.surname = surnameTextField.text
                user.username = CurrentUserDefaults.shared.getCurrentUser()!.username
                user.email = CurrentUserDefaults.shared.getCurrentUser()!.email
                
                UserDefaults.standard.removeObject(forKey: "currentUser")
                CurrentUserDefaults.shared.saveCurrentUserToUserDefaults(user: user)
                
                NetworkService().updateUserProfile(user: CurrentUserDefaults.shared.getCurrentUser()!) { user in
                    
                    if user != nil {
                        
                        CurrentUserDefaults.shared.saveCurrentUserToUserDefaults(user: user!)
                        //self.dismiss(animated: true)
                    }
                }
            } else {
                
                showAlert(text: "Please provide Surname")
            }
        } else {
            
            showAlert(text: "Please provide First Name")
        }
    }
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        
        print("Sign out button tapped")
        
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "currentUser")
        UserDefaults.standard.synchronize()
        
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        let signInController = storyborad.instantiateViewController(withIdentifier: "SignIn")
        signInController.modalPresentationStyle = .fullScreen
        self.present(signInController, animated: true, completion: nil)
    }
    
    @IBAction func deleteProfileButtonTapped(_ sender: UIButton) {
        
        print("Delete profile button tapped")
        NetworkService().deleteUserProfile { success in
            
            if success != nil {
                
                if success! {
                    
                    UserDefaults.standard.removeObject(forKey: "token")
                    UserDefaults.standard.removeObject(forKey: "currentUser")
                    UserDefaults.standard.synchronize()
                    
                    let storyborad = UIStoryboard(name: "Main", bundle: nil)
                    let signInController = storyborad.instantiateViewController(withIdentifier: "SignIn")
                    signInController.modalPresentationStyle = .fullScreen
                    self.present(signInController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func showAlert(text: String) {
        
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
}
