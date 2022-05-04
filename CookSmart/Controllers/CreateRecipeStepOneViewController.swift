//
//  CreateRecipeStepOneViewController.swift
//  CookSmart
//
//

import UIKit

class CreateRecipeStepOneViewController: UIViewController {
    
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var recipeCookTimePicker: UIDatePicker!
    @IBOutlet weak var recipeLevelSegment: UISegmentedControl!
    @IBOutlet weak var recipeNumberOfServingStepper: UIStepper!
    @IBOutlet weak var recipeNumberOfServingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeNameTextField.layer.cornerRadius = 5
        recipeNameTextField.layer.borderWidth = 1
        recipeNameTextField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        if recipeNameTextField.text!.count > 0 {
            
            if recipeCookTimePicker.countDownDuration > 0 {
                
                if recipeNumberOfServingStepper.value > 0 {
                    
                    performSegue(withIdentifier: "segue-to-create-recipe-step-two", sender: self)
                    
                } else {
                    
                    showAlert(text: "Please add number of servings")
                }
            } else {
                
                showAlert(text: "Please add cook time")
            }
        } else {
            
            showAlert(text: "Please add name of recipe")
        }
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        
        recipeNumberOfServingsLabel.text = String(Int(recipeNumberOfServingStepper.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue-to-create-recipe-step-two" {
            
            let destination = segue.destination as! CreateRecipeStepTwoViewController
            destination.recipeName = recipeNameTextField.text
            destination.recipeCookTime = Int(recipeCookTimePicker.countDownDuration / 60)
            destination.recipeServings = Int(recipeNumberOfServingStepper.value)
            
            if recipeLevelSegment.selectedSegmentIndex == 0 {
                destination.recipeLevel = "Easy"
            } else if recipeLevelSegment.selectedSegmentIndex == 1 {
                destination.recipeLevel = "Medium"
            } else if recipeLevelSegment.selectedSegmentIndex == 2 {
                destination.recipeLevel = "Hard"
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
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
