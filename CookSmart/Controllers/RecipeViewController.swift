//
//  RecipeViewController.swift
//  CookSmart
//
//

import UIKit

class RecipeViewController: UIViewController {
    
    var recipe: Recipe!
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeCookingTiime: UILabel!
    @IBOutlet weak var recipeLevel: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    
    @IBOutlet weak var RecipeCookingInstructions: UILabel!
    @IBOutlet weak var recipeServiingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeName.text = recipe.name
        recipeCookingTiime.text = "Cook time: \(recipe.cook_time!)"
        recipeLevel.text = "Level: " + recipe.level!
        recipeServiingsLabel.text = "Servings: \(recipe.number_of_servings!)"
        
        for i in recipe!.ingredients! {
            recipeIngredients.text! += "\n" + "\(i.amount!) \(i.name!)"
        }
        
        if recipe.instructions!.count  > 1 {
        var instructionsSorted = recipe!.instructions!.sort {$0.step_number! < $1.step_number! }
        }
        
        for c in  recipe.instructions!{
            
            RecipeCookingInstructions.text! += "\n" + c.title! + "\n" + c.description!
        }
        
        
        
        
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
