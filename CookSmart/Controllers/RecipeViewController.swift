//
//  RecipeViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 15/04/2021.
//

import UIKit

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
    
    //var rImage = #imageLiteral(resourceName: "Broccoli Pasta")
    //var rName: String?
    //var rType: String?
    //var rCookingTime: String?
    //var rLevel: String?
    //var rServings: String?
    //var rIngredients: String?
    //var rCookingInstructions: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImage.contentMode = .scaleToFill
        recipeImage.layer.cornerRadius = 5
        
        if var recipe = recipe {
            recipeImage.image = recipe.image
            recipeName.text = recipe.name
            recipeCookingTime.text = "COOKING TIME: " + String(recipe.cookTime) + "min"
            recipeLevel.text = recipe.level
            //recipeIngredients.text = getIngredients(recipe: recipe)
            recipeCookingInstructions.text = recipe.cookingInstruction
            recipeType.text = "TYPE: " + recipe.type!
            recipeServing.text = "Servings: " + String(stepper.value)
            
            ingredients = recipe.ingredietnsImportant + recipe.ingredietns
            for i in ingredients {
                recipeIngredients.text! += "\n" + i.getIngredientString()
            }
        }
        
        
        
        //view.backgroundColor = .blue
        //let label = UILabel()
        //label.text = name
        //label.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        //view.addSubview(label)
        
        //if let text = rName, let cookingTime = rCookingTime, let level = rLevel, let servings = rServings, let //ingredients = rIngredients, let cokingInstructions = rCookingInstructions, let type = rType {
            //self.recipeImage.image = rImage
            //self.recipeName.text = text
            //self.recipeCookingTime.text = "COOKING TIME: " + cookingTime + " min"
            //self.recipeLevel.text = level
            //self.recipeServing.text = "SERVINGS: " + servings + "\n"
            //self.recipeIngredients.text = ingredients
            //self.recipeCookingInstructions.text = cokingInstructions
            //self.recipeType.text = "TYPE: " + type
        //}

        //recipeName.text = ""
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        var ingredientsToMultiple: [Ingredient] = []
        
        recipeIngredients.text! = ""
        
        for var ingredient in ingredients {
            ingredient.multiplyAmount(value: Float(stepper.value))
            //ingredient.amount *= Float(stepper.value)
            print(ingredient.amount)
            ingredientsToMultiple.append(ingredient)
        }
        
        
        
        //for i in recipe. {
            
        //}
        
        for i in ingredientsToMultiple {
            recipeIngredients.text! += "\n" + i.getIngredientString()
        }
        
        recipeServing.text = "Servings: " + String(format: "%.f", stepper.value)
        
        //viewDidLoad()
    }
    
    
    
    func getIngredients(recipe: Recipe) -> String {
        print("stepper value: " + String(stepper.value))
        //recipe.multipleIngredients(number: Float(stepper.value))
        
        var s: String = ""
        
        //for i in recipe.ingredietns {
            //s.append(String(i.amount * stepper.value) + i.metric + i.nameOfIngredient + "\n")
           // }
        
       // for j in recipe.inredientsImportant {
            //s.append(i.amount * stepper.value + i.metric + i.nameOfIngredient + "\n"
            //}
            
            
        
        
        return s
        
        
        
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
