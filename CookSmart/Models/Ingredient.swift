//
//  Ingredient.swift
//  CookSmart
//
//  Created by Piotr Obara 
//

import Foundation

struct Ingredient {
    let amount: Float
    let metric: String?
    let nameOfIngredient: String

    func getIngredientString() -> String {
        var metric1 = ""
        
        if let m = metric {
            metric1 = m
        }
        
        var ingredientString = String(amount) + " " + String(metric1) + " " + nameOfIngredient
        return ingredientString
    }
    
}


