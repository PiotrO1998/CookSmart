//
//  EditProfileViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.text = CurrentUserDefaults.shared.getCurrentUser()?.first_name
        surnameTextField.text = CurrentUserDefaults.shared.getCurrentUser()?.surname
        
        firstNameTextField.layer.cornerRadius = 5
        firstNameTextField.layer.borderWidth = 1
        firstNameTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        surnameTextField.layer.cornerRadius = 5
        surnameTextField.layer.borderWidth = 1
        surnameTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
    }
    
    @IBAction func buttonSaveTapped(_ sender: UIButton) {
        
        if firstNameTextField.text!.count > 0 {
            
            if surnameTextField.text!.count > 0 {
                
            CurrentUserDefaults.shared.getCurrentUser()?.first_name = firstNameTextField.text
            CurrentUserDefaults.shared.getCurrentUser()?.surname = surnameTextField.text
            
                NetworkService().updateUserProfile(user: CurrentUserDefaults.shared.getCurrentUser()!) { user in
                    
                    if user != nil {
                        
                        CurrentUserDefaults.shared.saveCurrentUserToUserDefaults(user: user!)
                    }
                }
            }
        }
    }
    
    @IBAction func deleteProfileButtonTapped(_ sender: UIButton) {
        
        NetworkService().deleteUserProfile { success in
            
            if success != nil {
                
                if success! {
                    
                    //delete from defaults user token ...
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
}
