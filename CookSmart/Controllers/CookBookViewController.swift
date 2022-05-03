//
//  CookBookViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
//

import UIKit

class CookBookViewController: UIViewController {
    
    @IBOutlet weak var createRecipeButton: UIButton!
    @IBOutlet weak var myRecipesButton: UIButton!
    
    @IBOutlet weak var createMealPlanButton: UIButton!
    @IBOutlet weak var myMealPlansButton: UIButton!
    
    @IBOutlet weak var generateMealPlanButton: UIButton!
    
    var currentUserRecipes: [Recipe]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRecipeButton.layer.cornerRadius = 5
        createRecipeButton.layer.borderWidth = 1
        createRecipeButton.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        myRecipesButton.layer.cornerRadius = 5
        myRecipesButton.layer.borderWidth = 1
        myRecipesButton.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        createMealPlanButton.layer.cornerRadius = 5
        createMealPlanButton.layer.borderWidth = 1
        createMealPlanButton.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        myMealPlansButton.layer.cornerRadius = 5
        myMealPlansButton.layer.borderWidth = 1
        myMealPlansButton.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        generateMealPlanButton.layer.cornerRadius = 5
        generateMealPlanButton.layer.borderWidth = 1
        generateMealPlanButton.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
    }
    
    @IBAction func createRecipeButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "seque-to-create-recipe-step-one", sender: self)
    }
    
    @IBAction func myRecipesButtonTapped(_ sender: UIButton) {
        
        NetworkService().getCurrentUserRecipes { recipesData in
            
            if recipesData != nil {
                self.currentUserRecipes = recipesData!.data
                self.performSegue(withIdentifier: "segue-to-my-recipes", sender: self)
            }
        }
    }
    
    @IBAction func createMealPlanButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func myMealPlansButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func generateMealPlanButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func unwindToCookBook( _ seg: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue-to-my-recipes" {
            
            let vc = segue.destination as! MyRecipesViewController
            vc.recipes = currentUserRecipes!
        }
    }
    
}
