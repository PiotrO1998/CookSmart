//
//  Recipe.swift
//  CookSmart
//
//  Created by Piotr Obara 
//

import UIKit

struct Recipe {
    let name: String
    let image: UIImage
    let cookTime: Int
    let level: String
    let servings: Int //For how many people
    let ingredietnsImportant: [Ingredient]
    let ingredietns: [Ingredient]
    let cookingInstruction: String
    let source: String
    let type: String
    

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
    
    
}


