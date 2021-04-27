//
//  Recipe.swift
//  CookSmart
//
//  Created by Piotr Obara 
//

import UIKit

struct Recipe {
    var name: String
    var image: UIImage
    var cookTime: Int
    var level: String
    var servings: Int //For how many people
    var ingredietnsImportant: [Ingredient]
    var ingredietns: [Ingredient]
    var cookingInstruction: String
    var source: String?
    var type: String?
    
   func getIngredients() -> String {
        var ingredientsString: String = ""
    
        for ingredient in ingredietns {
            ingredientsString += ingredient.getIngredientString() + "\n"
            }
        for ingredient in ingredietnsImportant {
            ingredientsString += ingredient.getIngredientString() + "\n"
            }
    
        return ingredientsString
        }
    
    func getIngredientsArray() -> [String] {
        var ingredientsArray: [String] = []
        
        for ingredientImportant in ingredietnsImportant {
            ingredientsArray.append(ingredientImportant.nameOfIngredient)
        }

        for ingredient in ingredietns {
            ingredientsArray.append(ingredient.nameOfIngredient)
        }

        return ingredientsArray
    }
    
    func getIngredientsImportantArray() -> [String] {
        var ingredientsArray: [String] = []
        
        for ingredientImportant in ingredietnsImportant {
            ingredientsArray.append(ingredientImportant.nameOfIngredient)
        }
        return ingredientsArray
    }
    
    mutating func multipleIngredients(value: Float) {
        for var ingredient in ingredietnsImportant {
            ingredient.multiplyAmount(value: value)
        }
        
        for var ingredient in ingredietns {
            ingredient.multiplyAmount(value: value)
        }
    }
    
}


