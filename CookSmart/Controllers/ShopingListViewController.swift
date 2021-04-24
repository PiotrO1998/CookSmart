//
//  ShopingListViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 24/04/2021.
//

import UIKit

class ShopingListViewController: UIViewController {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelServings: UILabel!
    @IBOutlet weak var labelIngredients: UILabel!
    
    var recipes: [Recipe] = []
    var ingredientsAll: [Ingredient] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsAll = getAllIngredients(recipes: recipes)
        
        for ingredient in ingredientsAll {
            labelIngredients.text! += "\n" + ingredient.getIngredientString() 
        }
        
        labelServings.text = "Servings: " + String(format: "%.f", stepper.value)

        // Do any additional setup after loading the view.
    }
    
    func getAllIngredients(recipes: [Recipe]) -> [Ingredient] {
        var ingredients: [Ingredient] = []
        for recipe in recipes {
            ingredientsAll += recipe.ingredietnsImportant + recipe.ingredietns
        }
        
        for ingredient in ingredientsAll {
            if !ingredients.contains(ingredient) {
                ingredients.append(ingredient)
            } else {
                for var ing in ingredients {
                    if ing == ingredient {
                        ing.amount += ingredient.amount
                    }
                }
            }
        }
        
        return ingredients
        
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        var ingredientsToMultiple: [Ingredient] = []
        
        labelIngredients.text! = ""
        
        for var ingredient in ingredientsAll {
            ingredient.multiplyAmount(value: Float(stepper.value))
            //ingredient.amount *= Float(stepper.value)
            print(ingredient.amount)
            ingredientsToMultiple.append(ingredient)
        }
        
        for i in ingredientsToMultiple {
            labelIngredients.text! += "\n" + i.getIngredientString()
        }
        
        labelServings.text = "Servings: " + String(format: "%.f", stepper.value)
        
        
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
