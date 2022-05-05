//
//  CreateMyMealPlanStepOneViewController.swift
//  CookSmart
//
//

import UIKit

class CreateMyMealPlanStepOneViewController: UIViewController, UITextFieldDelegate {
    
    var recipes: [Recipe]?
    
    @IBOutlet weak var mealPlanNameTextField: UITextField!
    @IBOutlet weak var mealPlanTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealPlanNameTextField.delegate = self
        
        mealPlanTextView.layer.cornerRadius = 5
        mealPlanTextView.layer.borderWidth = 1
        mealPlanTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @IBAction func nextButttonTapped(_ sender: UIButton) {
        
        if mealPlanNameTextField.text!.count > 0 {
            
            if mealPlanTextView.text!.count > 0 {
        
        performSegue(withIdentifier: "segue-to-create-meal-plan-two", sender: self)
            } else {
                
                showAlert(text: "Please add meal plan description")
            }
        } else {
            
            showAlert(text: "Please add meal plan name")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue-to-create-meal-plan-two" {
            
            let vc = segue.destination as! CreateMyMealPlanStepTwoViewController
            vc.recipes = self.recipes
            vc.mealPlanName = mealPlanNameTextField.text
            vc.des = mealPlanTextView.text
            
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
