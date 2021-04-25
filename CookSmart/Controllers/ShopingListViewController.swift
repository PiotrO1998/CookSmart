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
    //var ingredients: [Ingredient] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsAll = getAllIngredients(recipes: recipes)
        
        for ingredient in ingredientsAll {
            labelIngredients.text! += "\n" + ingredient.getIngredientString() 
        }
        
        labelServings.text = "Servings: " + String(format: "%.f", stepper.value)

        // Do any additional setup after loading the view.
    }
    
    
    //function return sum up ingredients without duplicate
    func getAllIngredients(recipes: [Recipe]) -> [Ingredient] {
        var ingredientsFromAllRecipes: [Ingredient] = []
        var contactedIngredients: [String: Ingredient] = [:]
        var ingredientsFromAllRecipesFinal: [Ingredient] = []
        
        for recipe in recipes {
            ingredientsFromAllRecipes.append(contentsOf: recipe.ingredietnsImportant)
            ingredientsFromAllRecipes.append(contentsOf: recipe.ingredietns)
        }
        
        for ingredient in ingredientsFromAllRecipes {
            if let existedIngredient = contactedIngredients[ingredient.nameOfIngredient] {
                let summaryAmount = existedIngredient.amount + ingredient.amount
                var newIngredient = existedIngredient
                newIngredient.amount = summaryAmount
                contactedIngredients[ingredient.nameOfIngredient] = newIngredient
            } else {
                contactedIngredients[ingredient.nameOfIngredient] = ingredient
            }
        }
        
        for ingredient in contactedIngredients {
            ingredientsFromAllRecipesFinal.append(ingredient.value)
        }
        
        return ingredientsFromAllRecipesFinal
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
}


