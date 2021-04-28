

import UIKit

/// struct represent RecipeViewController object
///
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeType: UILabel!
    @IBOutlet weak var recipeCookingTime: UILabel!
    @IBOutlet weak var recipeLevel: UILabel!
    @IBOutlet weak var recipeServing: UILabel!
    
    @IBOutlet weak var recipeIngredients: UILabel!
    
    @IBOutlet weak var recipeCookingInstructions: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    var recipe: Recipe?
    
    var ingredients: [Ingredient] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImage.contentMode = .scaleToFill
        recipeImage.layer.cornerRadius = 5
        
        if let recipe = recipe {
            recipeImage.image = recipe.image
            recipeName.text = recipe.name
            recipeCookingTime.text = "COOKING TIME: " + String(recipe.cookTime) + "min"
            recipeLevel.text = recipe.level
            recipeCookingInstructions.text = recipe.cookingInstruction
            recipeType.text = "TYPE: " + recipe.type!
            recipeServing.text = "Servings: " + String(format: "%.f", stepper.value)
            
            ingredients = recipe.ingredietnsImportant + recipe.ingredietns
            for i in ingredients {
                recipeIngredients.text! += "\n" + i.getIngredientString()
            }
        }
    }
    
    //function is called when stepper is pressed
    @IBAction func stepperPressed(_ sender: UIStepper) {
        var ingredientsToMultiple: [Ingredient] = []
        
        recipeIngredients.text! = ""
        
        for var ingredient in ingredients {
            ingredient.multiplyAmount(value: Float(stepper.value))
            print(ingredient.amount)
            ingredientsToMultiple.append(ingredient)
        }
        
        for i in ingredientsToMultiple {
            recipeIngredients.text! += "\n" + i.getIngredientString()
        }
        
        recipeServing.text = "Servings: " + String(format: "%.f", stepper.value)
        }
    }
