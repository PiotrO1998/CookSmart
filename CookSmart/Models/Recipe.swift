//
//  Recipe.swift
//  CookSmart
//
//  Created by Piotr Obara on 14/04/2021.
//

import UIKit

struct Recipe {
    let name: String
    let image: UIImage
    let cookTime: String
    let level: String
    let servings: Int //For how many people
    var ingredietnsImportant: [Ingredient]
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
}


