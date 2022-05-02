//
//  CreateRecipeStepThreeViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 02/05/2022.
//

import UIKit

class CreateRecipeStepThreeViewController: UIViewController {
    
    var recipeName: String!
    var recipeCookTime: Int!
    var recipeLevel: String!
    var recipeServings: Int!
    var recipeImageString: String?
    var recipeDescription: String?
    var ingredients: [Ingredient] = []
    var editIngredient: Ingredient?
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var newIngredientButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        newIngredientButton.layer.cornerRadius = 5
        newIngredientButton.layer.borderWidth = 1
        newIngredientButton.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newIngredientButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segue-to-new-ingredient-view-controller", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue-to-new-ingredient-view-controller" {
            
            if editIngredient != nil {
                
                let destinationVC = segue.destination as! AddIngredientViewController
                destinationVC.editIngredieent = self.editIngredient
                editIngredient = nil
            }
        }
    }
    
    @IBAction func unwindToCreateRecipeStepThree( _ seg: UIStoryboardSegue) {
        
    }
    
    func showAlert(text: String) {
        
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension CreateRecipeStepThreeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientTableViewCell
        cell.ingredientLabel.text = "\(ingredients[indexPath.row].amount!) \(ingredients[indexPath.row].metric!) \(ingredients[indexPath.row].name!)"
        
        return cell
    }
}

extension CreateRecipeStepThreeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        editIngredient = ingredients[indexPath.row]
        ingredients.remove(at: indexPath.row)
        tableView.reloadData()
        performSegue(withIdentifier: "segue-to-new-ingredient-view-controller", sender: self)
    }
}
