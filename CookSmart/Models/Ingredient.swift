//
//  Ingredient.swift
//  CookSmart
//
//  Created by Piotr Obara 
//

import Foundation

struct Ingredient: Equatable {
    var amount: Float
    var metric: String?
    var nameOfIngredient: String
    
    func getIngredientString() -> String {
        var metric1 = ""
        
        if let m = metric {
             metric1 = m
        }
        
        var ingredientString = String(amount) + " " + String(metric1) + " " + nameOfIngredient 
        return ingredientString
    }
    
    mutating func multiplyAmount(value: Float) {
        amount = amount * value
    }
    
}


