//
//  CreateRecipeStepOneViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
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
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segue-to-create-recipe-step-two", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue-to-create-recipe-step-two" {
            
            let destination = segue.destination as! CreateRecipeStepTwoViewController
            destination.recipeName = recipeNameTextField.text
    
        }
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        
        recipeNumberOfServingsLabel.text = String(recipeNumberOfServingStepper.value)
        
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
