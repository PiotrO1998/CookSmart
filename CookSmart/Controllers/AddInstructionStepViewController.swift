//
//  AddInstructionStepViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 02/05/2022.
//

import UIKit

class AddInstructionStepViewController: UIViewController {
    
    @IBOutlet weak var stepTitleTextField: UITextField!
    @IBOutlet weak var stepDeescriptionTextView: UITextView!
    @IBOutlet weak var stepNumberTextField: UITextField!
    
    
    var editInstruction: Instruction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepDeescriptionTextView.layer.cornerRadius = 5
        stepDeescriptionTextView.layer.borderWidth = 1
        stepDeescriptionTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        if editInstruction != nil {
            
            stepTitleTextField.text = editInstruction!.title
            stepDeescriptionTextView.text = editInstruction!.description
            stepNumberTextField.text = "\(editInstruction!.step_number!)"
            editInstruction = nil
        }
    }
    
    
    @IBAction func addStepButtonTapped(_ sender: Any) {
        
        if stepTitleTextField.text!.count > 0 {
            
            if stepDeescriptionTextView.text.count > 0 {
                
                if stepNumberTextField.text!.count > 0 {
                
                performSegue(withIdentifier: "unwind-to-create-recipe-step-four", sender: self)
                } else {
                    
                    showAlert(text: "Please add step number")
                }
            } else {
                
                showAlert(text: "Please add description")
            }
        } else {
            
            showAlert(text: "Please add title")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "unwind-to-create-recipe-step-four" {
            
            var instruction: Instruction = Instruction()
            instruction.title = stepTitleTextField.text
            instruction.step_number = Int(stepNumberTextField!.text!)
            instruction.description = stepDeescriptionTextView.text
            
            
            let destinationVC = segue.destination as! CreateRecipeStepFourViewController
    
            destinationVC.instructions.append(instruction)
            destinationVC.instructions.sort { $0.step_number! < $1.step_number! }
            destinationVC.tableViewStep.reloadData()
        
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
