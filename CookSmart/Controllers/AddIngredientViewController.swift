//
//  AddIngredientViewController.swift
//  CookSmart
//
//

import UIKit

class AddIngredientViewController: UIViewController {
    
    var units: [String] = ["g", "kg", "ml", "l", "tsp", "tbsp", "pinch"]
    var unit: String?
    
    var editIngredieent: Ingredient?
    
    @IBOutlet weak var ingredientNameTextField: UITextField!
    @IBOutlet weak var ingredientAmountTextField: UITextField!
    @IBOutlet weak var ingredientUnitTextField: UITextField!
    @IBOutlet weak var ingredinetImportantSwitch: UISwitch!
    
    @IBOutlet weak var addIngredieentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addIngredieentButton.layer.cornerRadius = 5
        addIngredieentButton.layer.borderWidth = 1
        addIngredieentButton.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        
        if editIngredieent != nil {
            
            ingredientNameTextField.text = editIngredieent!.name
            ingredientAmountTextField.text = String(format: "%.f", editIngredieent!.amount as! CVarArg)
            ingredientUnitTextField.text = editIngredieent!.metric
            if editIngredieent!.is_important == 1 {
                ingredinetImportantSwitch.setOn(true, animated: false)
            }
            editIngredieent = nil
        }
        
    }
    
    @IBAction func addIngredientButtonTapped(_ sender: UIButton) {
        
        if ingredientNameTextField.text!.count > 0 {
            
            if ingredientAmountTextField.text!.count > 0 {
                
                if ingredientUnitTextField.text!.count > 0 {
                    
                    performSegue(withIdentifier: "unwind-to-add-recipe-step-three", sender: self)
                } else {
                    
                    showAlert(text: "Please add unit")
                }
            } else {
                
                showAlert(text: "Please add amount")
            }
        } else {
            
            showAlert(text: "Please add name")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "unwind-to-add-recipe-step-three" {
            
            var ingredient: Ingredient = Ingredient()
            ingredient.name = ingredientNameTextField.text
            ingredient.amount = Float(ingredientAmountTextField.text!)
            ingredient.metric = ingredientUnitTextField.text
            if ingredinetImportantSwitch.isOn {
                ingredient.is_important = 1
            } else {
                ingredient.is_important = 0
            }
            
            
            let destinationVC = segue.destination as! CreateRecipeStepThreeViewController
            destinationVC.ingredients.append(ingredient)
            destinationVC.tableView.reloadData()
            
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



