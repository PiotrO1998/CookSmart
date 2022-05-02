//
//  CreateRecipeStepFourViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 02/05/2022.
//

import UIKit

class CreateRecipeStepFourViewController: UIViewController {
    
    var recipeName: String!
    var recipeCookTime: Int!
    var recipeLevel: String!
    var recipeServings: Int!
    var recipeDescription: String?
    var ingredients: [Ingredient]!
    
    var instructions: [Instruction] = []
    var editInstruction: Instruction?
    
    @IBOutlet weak var tableViewStep: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewStep.dataSource = self
        tableViewStep.delegate = self
    }
    
    @IBAction func newStepButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segue-to-new-step-view-controller", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue-to-new-step-view-controller" {
            
            let destinationVC = segue.destination as! AddInstructionStepViewController
            
            if editInstruction != nil {
                
                destinationVC.editInstruction = self.editInstruction
            }
            editInstruction = nil
        }
    }
    
    @IBAction func addRecipeButtonTapped(_ sender: UIButton) {
        
        if instructions.count > 0 {
            
            var recipe = Recipe(name: recipeName, description: recipeDescription, cook_time: recipeCookTime, level: recipeLevel, number_of_servings: recipeServings, ingredients: ingredients, instructions: instructions)
            
                NetworkService().addRecipe(recipe: recipe) { rec in
                    
                    if rec != nil {
                        self.showAlert(text: "Successfully added recipe")
                    }
                }
            
            
        } else {
            
            showAlert(text: "Please add instruction steps")
        }
    }
    
    
    @IBAction func unwindToCreateRecipeStepFour( _ seg: UIStoryboardSegue) {
        
    }
    
    func showAlert(text: String) {
        
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }

}

extension CreateRecipeStepFourViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        instructions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StepCell", for: indexPath) as! StepTableViewCell
        cell.stepLabel.text = "Step: \(instructions[indexPath.row].step_number!)"
        cell.titleLabel.text = instructions[indexPath.row].title
        cell.descriptionText.text = instructions[indexPath.row].description
        
        return cell
    }
}

extension CreateRecipeStepFourViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        editInstruction = instructions[indexPath.row]
        instructions.remove(at: indexPath.row)
        tableView.reloadData()
        performSegue(withIdentifier: "segue-to-new-step-view-controller", sender: self)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completitionHandler) in
            
            self.instructions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completitionHandler(true)
        }
        
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
}
